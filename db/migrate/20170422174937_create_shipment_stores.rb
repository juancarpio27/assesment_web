class CreateShipmentStores < ActiveRecord::Migration[5.0]
  def change
    create_table :shipment_stores do |t|

      t.integer :shipment_id
      t.integer :product_id
      t.integer :quantity

      t.timestamps
    end
  end
end
