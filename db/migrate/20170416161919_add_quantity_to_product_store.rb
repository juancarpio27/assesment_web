class AddQuantityToProductStore < ActiveRecord::Migration[5.0]
  def change
    add_column :product_stores, :quantity, :integer, default: 0

  end
end
