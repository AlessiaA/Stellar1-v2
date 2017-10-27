class AddUserAndCelestialBodyToObservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :observations, :user, foreign_key: true
    add_reference :observations, :celestial_body, foreign_key: true
  end
end
