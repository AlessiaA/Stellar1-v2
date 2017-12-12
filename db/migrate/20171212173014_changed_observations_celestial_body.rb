class ChangedObservationsCelestialBody < ActiveRecord::Migration[5.1]
  def change
	remove_column :observations, :celestial_body_name
	add_reference :observations, :celestial_body, index: true
  end
end
