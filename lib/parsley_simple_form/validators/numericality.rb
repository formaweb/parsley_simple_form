require 'active_support/core_ext/hash/except'

module ParsleySimpleForm
  module Validators

    class Numericality < Base
      PARSLEY_VALIDATIONS = {
        greater_than_or_equal_to: :"parsley-min",
        less_than_or_equal_to: :"parsley-max",
      }.freeze

      def attribute_validate
        options_without_message = options.except(:message)
        attributes = options_without_message.each_with_object({}) do |(option, value), h|
          next unless parsley_attribute = PARSLEY_VALIDATIONS[option]

          h.merge!(parsley_attribute => value, "#{parsley_attribute}-message" => error_format(option, {count: value}))
        end

        if options_without_message.blank? || !options[:only_integer]
          attributes.merge!({:"parsley-type" => "number", :"parsley-type-number-message" => error_format(:not_a_number)})
        end

        if options_without_message[:only_integer]
          attributes.merge!({:"parsley-type" => "digits", :"parsley-type-digits-message" => error_format(:not_a_number)})
        end

        attributes 
      end

      private

      def error_format(name_validate, count_option={})
        options[:message] || message_error(count_option, name_validate)
      end
    end

  end
end