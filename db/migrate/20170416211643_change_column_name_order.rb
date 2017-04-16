class ChangeColumnNameOrder < ActiveRecord::Migration[5.0]
  def self.up
    rename_column :orders, :status, :order_status
  end
end
