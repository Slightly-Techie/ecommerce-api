module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    include Authorizable
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    field :errors, [Types::ErrorType], null: true
    field :status, Int, null: false

    def respond(status, options = {})
      options[:errors] = options[:errors].present? ? generate_errors(options[:errors]) : nil
      { status: status, **options }
    end

    private

      def generate_errors(errors)
        result = []
        errors.each do |key, value|
          result.push({ property: key, message: value })
        end
        result
      end
  end
end
