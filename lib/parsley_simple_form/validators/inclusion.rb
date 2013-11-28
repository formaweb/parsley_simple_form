module ParsleySimpleForm
  module Validators

    class Inclusion < Base
      def attribute_validate
        inlist_string = options[:in].join(", ")
        {:"parsley-inlist" => inlist_string, :"parsley-inlist-message" => message_error}
      end
    end

  end
end