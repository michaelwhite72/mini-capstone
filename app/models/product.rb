class Product < ApplicationRecord

  # validates :name, uniqueness: true, presence: true
  # validates :description, length: {in: 10..500}
  # validates :price, numericality: {greater_than: 0}
  # validates :quantity, numericality: {greater_than: 0}

  #association method (instance method)
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  has_many :images
  has_many :category_products
  has_many :categories, through: :category_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  #instance method/model method
  def is_discounted?
    price <= 10
  end

  def tax
    (price * 0.09).to_f
  end

  def total
    (price + tax)
  end
end
