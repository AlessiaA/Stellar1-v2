class ChangedObservationsToolsId < ActiveRecord::Migration[5.1]
  def change
	remove_column :observations, :telescope_name
	remove_column :observations, :binocular_name
	remove_column :observations, :eyepiece_name
	remove_column :observations, :filter_name
	add_reference :observations, :telescope, index: true
	add_reference :observations, :binocular, index: true
	add_reference :observations, :eyepiece, index: true
	add_reference :observations, :filter, index: true
  end
end
