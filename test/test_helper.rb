require 'bundler/setup'

require 'minitest/autorun'

require 'active_model'
require 'action_view'
require 'action_view/template'
require 'action_view/test_case'

require 'simple_form'

module Rails
  def self.env
    ActiveSupport::StringInquirer.new("test")
  end
end

$:.unshift File.expand_path("../../lib", __FILE__)

require 'parsley_simple_form'

ActionDispatch::Assertions::NO_STRIP << "label"

Dir["#{File.dirname(__FILE__)}/support/*.rb"].each{|f| require(f)}

class ActionView::TestCase
  include ParsleySimpleForm::SimpleFormExtensions::FormHelper
  include MiscHelper

  setup :setup_company
  setup :setup_controller

  def setup_controller
    @controller = MockController.new
  end

  def setup_company
    @company = Company.new
  end

  def companies_path(*args)
    "/companies"
  end

  def default_url_options
    {}
  end

  def url_for(*)
    "http://exemplo.com"
  end
end