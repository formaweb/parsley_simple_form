require 'test_helper'

class SimpleFormAdaptTest < ActionView::TestCase
  test "add attribute require when model has presence validation" do
    parsley_concat_form(@company) do |f|
      assert f.instance_of?(ParsleySimpleForm::SimpleFormAdapt)
    end
  end
end