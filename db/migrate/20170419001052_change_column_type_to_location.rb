class ChangeColumnTypeToLocation < ActiveRecord::Migration[5.0]
  def change
    change_column :stores, :latitude, :decimal
    change_column :stores, :longitude, :decimal
  end
end
