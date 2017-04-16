class CreateProductOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :product_orders do |t|

      t.integer :product_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false

      t.timestamps
    end
  end
end
