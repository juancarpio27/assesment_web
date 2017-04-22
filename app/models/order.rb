class Order < ApplicationRecord

  belongs_to :user
  belongs_to :store

  has_many :product_orders
  has_many :products, through: :product_orders

  accepts_nested_attributes_for :product_orders

  module Json
    LIST = {
        methods: [:store],
        include: {
            product_orders:{
                methods: [:product]
            }
        }
    }
    SHOW = {
        methods: [:store],
        include: {
            product_orders:{
                methods: [:product]
            }
        }
    }

    CREATE = {
        include: {
            user:{
                methods: [:access_token]
            }
        }
    }
  end

  enum order_status: [:received, :canceled, :delivered]
  enum method: [:card, :points, :cash]

  before_create :set_received

  def set_received
    self.received = DateTime.now
  end

  def calculate_total
    price = 0
    self.product_orders.each do |p|
      price += p.quantity * p.product.price
    end
    price
  end

end
