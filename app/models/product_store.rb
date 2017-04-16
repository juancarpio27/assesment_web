class ProductStore < ApplicationRecord

  module Json
    LIST = {
        include: {
            product: {

            }
        }
    }
  end

  belongs_to :store
  belongs_to :product

end
