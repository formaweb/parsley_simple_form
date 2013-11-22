require 'test_helper'

class FormHelperTest < ActionView::TestCase
  test "create form with data attribute of parsley" do
    concat parsley_simple_for(@company){}

    assert_select "form[parsley-validate]"
  end
end