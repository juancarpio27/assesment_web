class AddPaymentOptionToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :card_id, :integer
    add_column :orders, :method, :integer
  end
end
