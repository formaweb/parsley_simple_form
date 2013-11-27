Column = Struct.new(:type, :limit) do
  def number?
    type == (:integer || :float || :decimal)
  end
end
class Company
  include ActiveModel::Model

  attr_accessor :name, :address, :number, :number_only_integer

  validates :name, :address, :number, presence: {message: "cannot be blank!"}
  validates :name, length: {in: 6..20}
  validates :address, length: {minimum: 10, maximum: 100, too_long: "100 characters is the maximum allowed", too_short: "10 characters is the minimum allowed"}
  validates :number, numericality: {greater_than_or_equal_to: 6, less_than_or_equal_to: 100, message: "is an invalid number."}
  validates :number_only_integer, numericality: {only_integer: true, message: "is an invalid number."}

  def column_for_attribute(attribute_name)
    column = case attribute_name.to_sym
      when :name then :string
      when :address then :string
      when :number then :integer
    end
    Column.new(column)
  end

  def model_name
    "Company"
  end

end