class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable

  module Json
    SHOW = {
        only: [:id, :name, :lastname, :email, :sex, :age, :points],
        methods: [:access_token]
    }
  end

  enum sex: [:female, :male]

  before_create :set_points

  has_many :api_keys
  has_many :sessions
  has_many :cards

  has_many :orders

  validates :name, presence: true, length: {in: 2..75}
  validates :lastname, presence: true, length: {in: 2..90}
  validates :age, presence: true
  validates :sex, presence: true
  validates :email, presence: true, uniqueness: true

  def set_points
    self.points = 0
  end

  def access_token
    api_keys.first.nil? ? nil : api_keys.last.access_token
  end

end
