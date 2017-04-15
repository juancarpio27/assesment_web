class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable

  module Json
    SHOW = {
        only: [:id, :name, :lastname, :email, :sex, :age, :points]
    }
  end

  enum sex: [:female, :male]

  before_create :set_points

  has_many :api_keys
  has_many :sessions

  def set_points
    points = 0
  end

end
