require 'test_helper'

class CustomTest < ActionView::TestCase
  test "add attribute minlength or maxlength when validates length defined" do
    parsley_concat_form(@company) do |f|
      f.input :email
    end

    assert_select 'input[parsley-type=email]'
    assert_select 'input[parsley-type-email-message="is not an email."]'
  end

end