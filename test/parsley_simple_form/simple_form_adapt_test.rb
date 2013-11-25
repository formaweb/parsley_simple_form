require 'test_helper'

class SimpleFormAdaptTest < ActionView::TestCase
  test "verify whether helper is a instance of ParsleySimpleForm::SimpleFormAdapt" do
    parsley_concat_form(@company) do |f|
      assert f.instance_of?(ParsleySimpleForm::SimpleFormAdapt)
    end
  end
end