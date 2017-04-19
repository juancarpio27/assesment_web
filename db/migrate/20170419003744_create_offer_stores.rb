class CreateOfferStores < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_stores do |t|

      t.string :description
      t.integer :store_id
      t.string :imager

      t.timestamps
    end
  end
end
