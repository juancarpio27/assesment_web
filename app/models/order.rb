class Order < ApplicationRecord

  belongs_to :user
  belongs_to :store

  has_many :product_orders

  enum status: [:received, :canceled, :received]
  enum method: [:card, :points, :cash]

end
