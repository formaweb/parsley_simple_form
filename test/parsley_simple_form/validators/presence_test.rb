require 'test_helper'

class PresenceTest < ActionView::TestCase
  test "add attribute require when model has presence validation" do
    parsley_concat_form(@company) do |f|
      f.input :name
    end

    assert_select 'input[parsley-required]'
    assert_select 'input[parsley-required-message="cannot be blank!"]'
  end
end