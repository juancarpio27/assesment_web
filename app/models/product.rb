class Product < ApplicationRecord

  has_many :product_stores
  has_many :stores, through: :product_stores
  has_many :product_orders
  has_many :shipment_stores

  belongs_to :category

end
