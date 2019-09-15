class RemoveFieldNameFromPorts < ActiveRecord::Migration[5.2]
  def change
    remove_column :ports, :token, :string
  end
end
