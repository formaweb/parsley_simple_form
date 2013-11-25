module ParsleySimpleForm
  module Validators

    class Base
      attr_reader :validate, :options

      def initialize(validate)
        @validate = validate
        @options = validate.options
      end

    end

  end
end