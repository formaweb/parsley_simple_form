Column = Struct.new(:type, :limit) do
  def number?
    type == (:integer || :float || :decimal)
  end
end

class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class Company
  include ActiveModel::Model

  attr_accessor :name, :address, :number, :number_only_integer, :phone_kind, :email

  validates :name, :address, :number, presence: {message: "cannot be blank!"}
  validates :name, length: {in: 6..20}
  validates :address, length: {minimum: 10, maximum: 100, too_long: "100 characters is the maximum allowed", too_short: "10 characters is the minimum allowed"}
  validates :number, numericality: {greater_than_or_equal_to: 6, less_than_or_equal_to: 100, message: "is an invalid number."}
  validates :number_only_integer, numericality: {only_integer: true, message: "is an invalid number."}
  validates :phone_kind, inclusion: {in: %w(phone cell-phone), message: "is not included in the list"}
  validates :email, email: true

  def column_for_attribute(attribute_name)
    column = case attribute_name.to_sym
      when :name then :string
      when :address then :string
      when :number then :integer
      when :number_only_integer then :integer
      when :phone_kind then :string
      when :email then :string
    end
    Column.new(column)
  end

  def model_name
    "Company"
  end

end