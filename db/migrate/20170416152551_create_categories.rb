class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name,  limit: 120, null: false

      t.timestamps
    end
  end
end
