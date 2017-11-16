class AddUserAndCelestialBodyToObservations < ActiveRecord::Migration[5.1]
  def change
	 add_column :observations, :celestial_body_name, :string
     add_reference :observations, :user, index: true
  end
end
