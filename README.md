# Parsley ♥ SimpleForm

[ParsleyJS](http://parsleyjs.org) together with [SimpleForm](https://github.com/plataformatec/simple_form).
This very simple gem join both and putting Parsley attributes in your inputs as defined Rails validations!
Just validate your models and the attributes will appear in the inputs

**Warning:** It's an early version stage!

## Installation

Add this line to your application's Gemfile:

    gem 'parsley_simple_form', github: 'formaweb/parsley_simple_form'

And then execute:

    $ bundle

## Usage

Following instructions to add Parsley JS, here: https://github.com/mekishizufu/parsley-rails

Validate your model as:

```Ruby
class Company < ActiveRecord::Base
  validates :name, :address, :number, presence: true
  validates :name, length: {in: 6..20}
  validates :number, numericality: true
end
```

Create your form as:

```Ruby
parsley_simple_for(@company) do |f|
  f.input :name
end
```

Just it! Parsley attributes will put in your inputs automagic!

## Dependencies

* [ParsleyJS](http://parsleyjs.org)
* [Simple Form](https://github.com/plataformatec/simple_form)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License. Copyright 2013 Formaweb. http://formaweb.com.br