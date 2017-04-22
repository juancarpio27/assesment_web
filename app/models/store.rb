class Store < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :opening_hour, presence: true
  validates :closing_hour, presence: true
  validates :phone, presence: true

  has_many :product_stores, dependent: :destroy
  has_many :products, through: :product_stores
  has_many :orders
  has_many :employees
  has_many :shipments

  has_many :offer_stores

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  def today_orders
    date = Time.now - 5.hours
    self.orders.where(pickup: date.midnight..date.end_of_day)
  end

  def today_shipments
    date = Time.now - 5.hours
    self.shipments.where(requested: date.midnight..date.end_of_day)
  end

end
