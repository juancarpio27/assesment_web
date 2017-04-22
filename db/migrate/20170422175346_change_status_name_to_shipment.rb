class ChangeStatusNameToShipment < ActiveRecord::Migration[5.0]
  def change
    rename_column :shipments, :status, :shipment_status
  end
end
