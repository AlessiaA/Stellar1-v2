class ChangedObservativeSessionLocation < ActiveRecord::Migration[5.1]
  def change
	remove_column :observative_sessions, :name
	remove_column :observative_sessions, :latitude
	remove_column :observative_sessions, :longitude
	remove_column :observative_sessions, :altitude
	remove_column :observative_sessions, :bortle
	remove_column :observative_sessions, :sqm
	add_reference :observative_sessions, :location, index: true
  end
end
