class Company
  include ActiveModel::Model

  attr_accessor :name, :address, :number

  validates :name, :address, :number, presence: true
  validates :name, :address, length: { maximum: 100 }
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