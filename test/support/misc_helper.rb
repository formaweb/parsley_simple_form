module MiscHelper
  def parsley_concat_form(object, *args, &block)
    concat(parsley_simple_for object, *args, &(block || proc{}))
  end
end