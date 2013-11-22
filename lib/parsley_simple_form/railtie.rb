require 'rails/railtie'

module ParsleySimpleForm
  class Railtie < Rails::Railtie
    config.eager_load_namespaces << ParsleySimpleForm
  end
end