require 'test_helper'

class NumericallityTest < ActionView::TestCase
  test "add attribute number when numericality were set." do
    parsley_concat_form(@company) do |f|
      f.input :number
    end

    assert_select 'input[parsley-type="number"]'
    assert_select 'input[parsley-type-number-message="is an invalid number."]'

    assert_select 'input[parsley-min="6"]'
    assert_select 'input[parsley-min-message="is an invalid number."]'

    assert_select 'input[parsley-max="100"]'
    assert_select 'input[parsley-max-message="is an invalid number."]'
  end

  test "add attribute digits when numericality were set with option only_integer." do
    parsley_concat_form(@company) do |f|
      f.input :number_only_integer
    end

    assert_select 'input[parsley-type="digits"]'
    assert_select 'input[parsley-type-digits-message="is an invalid number."]'
  end
end