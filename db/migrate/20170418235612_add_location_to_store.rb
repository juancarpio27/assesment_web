class AddLocationToStore < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :longitude, :decimal, scale: 6, precision: 8
    add_column :stores, :latitude, :decimal, scale: 6, precision: 8
  end
end
