class Company
  include ActiveModel::Model

  attr_accessor :name, :address, :number

  validates :name, :address, :number, presence: {message: "cannot be blank!"}
  validates :name, length: {in: 6..20}
  validates :address, length: {minimum: 10, maximum: 100, too_long: "100 characters is the maximum allowed", too_short: "10 characters is the minimum allowed"}
  validates :number, numericality: true

  def column_for_attribute(attribute_name)
    column = case attribute_name.to_sym
    when :name then :string
    when :address then :string
    when :number then :integer
    end
  end

  def model_name
    "Company"
  end

end