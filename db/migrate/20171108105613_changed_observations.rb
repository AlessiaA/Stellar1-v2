class ChangedObservations < ActiveRecord::Migration[5.1]
  def change
	remove_column :observations, :completed
	add_reference :observations, :telescope, foreign_key: true
    add_reference :observations, :binocular, foreign_key: true
	add_reference :observations, :filter, foreign_key: true
    add_reference :observations, :eyepiece, foreign_key: true
  end
end
