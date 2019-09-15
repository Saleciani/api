class ChangeLatLonToString < ActiveRecord::Migration[5.2]
  def change
    change_column :ports, :latitude, :string
    change_column :ports, :longitude, :string
  end
end
