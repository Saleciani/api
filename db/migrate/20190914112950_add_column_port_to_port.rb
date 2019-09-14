class AddColumnPortToPort < ActiveRecord::Migration[5.2]
  def change
    add_column :ports, :port, :string
  end
end
