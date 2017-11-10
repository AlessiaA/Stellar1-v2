class ChangedCelestialBodies < ActiveRecord::Migration[5.1]
  def change
	add_column :celestial_bodies, :ascension, :datetime
	add_column :celestial_bodies, :declination, :integer
	add_column :celestial_bodies, :magnitudo, :decimal
	add_column :celestial_bodies, :separation, :integer
	
  end
end
