class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :user_id, null: false
      t.integer :store_id, null: false
      t.integer :status, null: false
      t.integer :price, null: false
      t.datetime :pickup, null: false
      t.datetime :received, default: nil

      t.timestamps
    end
  end
end
