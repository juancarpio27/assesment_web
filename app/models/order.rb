class Order < ApplicationRecord

  belongs_to :user
  belongs_to :store

  has_many :product_orders

  enum order_status: [:received, :canceled, :delivered]
  enum method: [:card, :points, :cash]

  before_create :set_received

  def set_received
    self.received = DateTime.now
  end

end