module ParsleySimpleForm
  module Validators

    class Presence < Base
      def attribute_validate
        {:"parsley-required" => true, :"parsley-required-message" => message_error}
      end
    end

  end
end