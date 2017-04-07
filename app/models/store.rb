class Store < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :opening_hour, presence: true
  validates :closing_hour, presence: true
  validates :phone, presence: true

end
