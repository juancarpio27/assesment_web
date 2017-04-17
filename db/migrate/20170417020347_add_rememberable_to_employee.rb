class AddRememberableToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :remember_created_at, :datetime
  end
end
