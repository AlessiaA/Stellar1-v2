class ChangedObservationTable < ActiveRecord::Migration[5.1]
  def change
  
    remove_reference :observations, :celestial_body, index: true
	remove_reference :observations, :telescope, index: true
    remove_reference :observations, :binocular, index: true
	remove_reference :observations, :filter, index: true
    remove_reference :observations, :eyepiece, index: true
	remove_reference :observations, :user, index: true
	remove_reference :observations, :observative_session, index: true
	add_column :observations, :telescope_name, :string
	add_column :observations, :binocular_name, :string
	add_column :observations, :eyepiece_name, :string
	add_column :observations, :filter_name, :string
	add_column :observations, :celestial_body_name, :string
	add_foreign_key :observations, :users
	add_foreign_key :observations, :observative_sessions
	
  end
end
