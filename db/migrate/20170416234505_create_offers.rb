class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|

      t.string :description
      t.string :image
      t.datetime :expiration

      t.timestamps
    end
  end
end
