class CreatePorts < ActiveRecord::Migration[5.2]
  def change
    create_table :ports do |t|
      t.integer :nr
      t.string :name
      t.string :code
      t.string :city
      t.string :oceaninsightscode
      t.integer :latitude
      t.integer :longitude
      t.string :bigschedules
      t.datetime :createdat
      t.datetime :updatedat
      t.string :porttype
      t.boolean :hubport
      t.string :oceaninsights

      t.timestamps
    end
  end
end
