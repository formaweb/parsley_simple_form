require 'test_helper'

class LengthTest < ActionView::TestCase
  test "add attribute minlength or maxlength when validates length defined" do
    parsley_concat_form(@company) do |f|
      f.input :address
    end

    assert_select 'input[parsley-maxlength]'
    assert_select 'input[parsley-maxlength-message="100 characters is the maximum allowed"]'

    assert_select 'input[parsley-minlength]'
    assert_select 'input[parsley-minlength-message="10 characters is the minimum allowed"]'
  end

  test "add attribute minlength and maxlength when validates it's a range" do
    parsley_concat_form(@company) do |f|
      f.input :name
    end

    assert_select 'input[parsley-maxlength]'
    assert_select 'input[parsley-minlength]'
  end
end