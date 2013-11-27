module ParsleySimpleForm
  module Validators
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Presence
    autoload :Length
    autoload :Numericality
  end
end