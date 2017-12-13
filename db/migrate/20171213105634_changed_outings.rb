class ChangedOutings < ActiveRecord::Migration[5.1]
  def change
	remove_column :outings, :location
	add_reference :outings, :location, index: true
  end
end
