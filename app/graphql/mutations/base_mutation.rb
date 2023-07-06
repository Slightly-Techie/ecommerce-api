module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject



    protected

      def respond(status, options = {})
        options[:errors] = options[:error].present? ?
          generate_errors(options[:error]) : nil

        { status: status, **options }
      end

    private

      def generate_errors(errors)
        errors = errors.to_hash if errors.is_a? ActiveModel::Errors
        errors.map { |key, value| { property: key, message: value.is_a?(Array) ? value.join(", ") : value } }
      end
  end
end
