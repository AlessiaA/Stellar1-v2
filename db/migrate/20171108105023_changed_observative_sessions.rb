class ChangedObservativeSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :observative_sessions, :date, :datetime
	add_column :observative_sessions, :latitude, :decimal
	add_column :observative_sessions, :longitude, :decimal
	add_column :observative_sessions, :altitude, :integer
	add_column :observative_sessions, :bortle, :integer
	add_column :observative_sessions, :sqm, :decimal
	add_column :observative_sessions, :completed, :boolean
	add_column :observative_sessions, :notes, :string
	remove_column :observative_sessions, :category
  end
end
