class CreatedOutings < ActiveRecord::Migration[5.1]
  def change
    create_table :outings do |t|
      t.timestamp :day
      t.string :location
      t.timestamp :time

      t.timestamps
    end
  end
end
