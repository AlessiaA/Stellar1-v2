class CreateTelescopes < ActiveRecord::Migration[5.0]
  def change
    create_table :telescopes do |t|
      t.string :brand
      t.string :name
      t.text :description
      t.text :notes
      t.float :angular_resolution
      t.float :magnitude
      t.float :focal_ratio
      t.integer :finderscope
      t.integer :focal_length
      t.integer :mount
      t.integer :aperture
      t.string :typology

      t.timestamps
    end
  end
end
