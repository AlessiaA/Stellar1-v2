class CreateCelestialBodies < ActiveRecord::Migration[5.1]
  def change
    create_table :celestial_bodies do |t|
      t.string :name
      t.string :typology
      t.float :size
      t.string :constellation
      t.integer :map_chart_number

      t.timestamps
    end
  end
end
