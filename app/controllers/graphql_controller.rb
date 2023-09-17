class GraphqlController < ApiController
  def execute
    variables = prepare_variables(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      current_user: current_user,
      request: request
    }
    result = EcommerceApiSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue StandardError => e
    raise e unless Rails.env.development?

    handle_error_in_development(e)
  end

  private

    # Handle variables in form data, JSON body, or a blank value
    def prepare_variables(variables_param)
      case variables_param
      when String
        if variables_param.present?
          JSON.parse(variables_param) || {}
        else
          {}
        end
      when Hash
        variables_param
      when ActionController::Parameters
        variables_param.to_unsafe_hash # GraphQL-Ruby will validate name and type of incoming variables.
      when nil
        {}
      else
        raise ArgumentError, "Unexpected parameter: #{variables_param}"
      end
    end

    def handle_error_in_development(e)
      logger.error e.message
      logger.error e.backtrace.join("\n")

      render json: { errors: [{ message: e.message, backtrace: e.backtrace }], data: {} }, status: 500
    end

    def current_user
      # return nil if should_skip_session_validation?

      token = request.headers["Authorization"]
      return nil if token.blank?

      session = Session.find_by_token(token)
      user = User.active.find_by_id(session&.user_id)
      return :not_found if user.blank?
      return :expired if session.expired?

      user
    end

    def should_skip_session_validation?
      ["login", "IntrospectionQuery"].any? { |query_name| params[:query].include?(query_name) }
    end
end
