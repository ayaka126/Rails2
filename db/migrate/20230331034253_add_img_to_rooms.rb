class AddImgToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :img, :string
  end
end
