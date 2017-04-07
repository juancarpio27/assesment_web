class CreateProductStores < ActiveRecord::Migration[5.0]
  def change
    create_table :product_stores do |t|

      t.integer :store_id, null: false
      t.integer :product_id, null: false

      t.timestamps
    end
    add_foreign_key :product_stores, :stores
    add_foreign_key :product_stores, :products
  end
end
