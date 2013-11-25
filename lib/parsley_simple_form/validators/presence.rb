module ParsleySimpleForm
  module Validators

    class Presence < Base
      def attribute_validate
        {:"parsley-required" => true}
      end
    end

  end
end