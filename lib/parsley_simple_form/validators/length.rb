module ParsleySimpleForm
  module Validators

    class Length < Base
      PARSLEY_VALIDATES = {
        minimum: :"parsley-minlength",
        maximum: :"parsley-maxlength"
      }

      def attribute_validate
        options.each_with_object({}) do |(option, value), h|
          next unless key = PARSLEY_VALIDATES[option]
          options_message = {message: options_message_for(option), count: options[option]}

          h.merge! key => value, "#{key}-message" => message_error(options_message)
        end
      end

      private

      def options_message_for(option)
        message = ActiveModel::Validations::LengthValidator::MESSAGES[option]
        return options[message] if options.include? message
        
        message
      end
    end

  end
end