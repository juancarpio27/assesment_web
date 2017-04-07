class Product < ApplicationRecord

  has_many :product_stores
  has_many :stores, through: :product_stores

end
