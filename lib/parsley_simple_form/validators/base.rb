module ParsleySimpleForm
  module Validators

    class Base
      attr_reader :object, :error, :validate, :options, :attribute_name

      def initialize(object, validate, attribute_name)
        @object = object
        @error = object.errors
        @validate = validate
        @options = validate.options.dup
        @attribute_name = attribute_name
      end

      def message_error
        generate_message
      end

      protected

      def generate_message
        error.generate_message(attribute_name, validate.kind, options)
      end
    end

  end
end