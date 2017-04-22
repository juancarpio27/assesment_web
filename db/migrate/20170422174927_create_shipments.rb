class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|

      t.integer :store_id
      t.integer :status, default: :waiting
      t.datetime :requested
      t.datetime :received

      t.timestamps
    end
  end
end
