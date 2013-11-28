require 'test_helper'

class InclusionTest < ActionView::TestCase
  test "add attribute minlength or maxlength when validates length defined" do
    parsley_concat_form(@company) do |f|
      f.input :phone_kind
    end

    assert_select 'input[parsley-inlist="phone, cell-phone"]'
  end

end