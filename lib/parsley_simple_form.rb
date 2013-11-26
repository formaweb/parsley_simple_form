require 'simple_form'
require 'action_view'
require 'active_model'

require 'parsley_simple_form/version'
require 'parsley_simple_form/simple_form_extensions/form_helper'

module ParsleySimpleForm
  extend ActiveSupport::Autoload

  eager_autoload do
    autoload :Validators
    autoload :SimpleFormAdapt
  end

  def self.eager_load!
    super
    ParsleySimpleForm::Validators.eager_load!
  end

  # Configuration to add more boolean attributes
  mattr_acessor :parsley_attributes
  @@parsley_attributes = [
    "parsley-validate",
    "parsley-required",
  ]

  ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES << Set.new(@@parsley_attributes)
  ActionView::Helpers::TagHelper::BOOLEAN_ATTRIBUTES.flatten!
end

require 'parsley_simple_form/railtie' if defined?(Rails)