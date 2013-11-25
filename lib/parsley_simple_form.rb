require 'simple_form'
require 'action_view'

require 'parsley_simple_form/version'
require 'parsley_simple_form/simple_form_extensions/form_helper'
require 'parsley_simple_form/validators'
require 'parsley_simple_form/simple_form_adapt'

module ParsleySimpleForm
  extend ActiveSupport::Autoload
  @@parsley_attributes = [
    "parsley-validate",
    "parsley-required",
  ]

  ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES << Set.new(@@parsley_attributes)

  ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES.flatten!
end