class AddPictureToStore < ActiveRecord::Migration[5.0]
  def up
    add_attachment :stores, :picture
  end

  def down
    remove_attachment :stores, :picture
  end
end
