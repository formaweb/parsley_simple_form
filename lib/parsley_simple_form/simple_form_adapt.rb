# Provide a custom class of SimpleForm
module ParsleySimpleForm
  class SimpleFormAdapt < SimpleForm::FormBuilder
    map_type :presence_validation, to: ParsleySimpleForm::Validators::Presence
    map_type :length_validation, to: ParsleySimpleForm::Validators::Length
    map_type :numericality_validation, to: ParsleySimpleForm::Validators::Numericality
    map_type :inclusion_validation, to: ParsleySimpleForm::Validators::Inclusion

    # Add parsley attributes validation
    def input(attribute_name, options = {}, &block)
      options[:input_html] ||= {}
      parsley_validations = validations_for(attribute_name)

      options[:input_html].merge!(parsley_validations)
      super
    end

    private

    def validations_for(attribute_name)
      object_class.validators_on(attribute_name).each_with_object({}) do |validate, attributes|
        next unless klass = validate_constantize(validate.kind)

        attributes.merge! klass.new(object, validate, attribute_name).attribute_validate
      end
    end

    # This method will search get custom method, whether don't find get validation from ParsleySimpleForm
    def validate_constantize(validate_kind)
      get_custom_validation(validate_kind) || mappings["#{validate_kind}_validation".to_sym] || false
    end

    def get_custom_validation(klass)
      camelized = klass.to_s.camelize
      begin
        Object.const_get(camelized)
      rescue
        false
      end
    end

    def object_class
      object.class
    end
  end
end