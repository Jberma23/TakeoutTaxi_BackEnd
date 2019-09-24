class ChangeDisplayLocationToAdress < ActiveRecord::Migration[5.2]
  def change
    rename_column :trucks, :display_location, :address
  end
end
