class Shipment < ApplicationRecord

  enum shipment_status: [:waiting, :canceled, :delivered]

  belongs_to :store
  has_many :shipment_stores


end
