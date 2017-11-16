class ChangedObservations < ActiveRecord::Migration[5.1]
  def change
	remove_column :observations, :completed
	add_column :observations, :telescope_name, :string
	add_column :observations, :binocular_name, :string
	add_column :observations, :eyepiece_name, :string
	add_column :observations, :filter_name, :string
  end
end
