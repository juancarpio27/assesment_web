class ProductOrder < ApplicationRecord

  belongs_to :product
  belongs_to :order, required: false

  accepts_nested_attributes_for :order

end
