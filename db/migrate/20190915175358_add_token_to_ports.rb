class AddTokenToPorts < ActiveRecord::Migration[5.2]
  def change
    add_column :ports, :token, :string
  end
end
