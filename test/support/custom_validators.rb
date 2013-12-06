module Validators
  class Email < ParsleySimpleForm::Validators::Base
    def attribute_validate
      {:"parsley-type" => 'email', :"parsley-type-email-message" => 'is not an email.'}
    end
  end
end