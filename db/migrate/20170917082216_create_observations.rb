class CreateObservations < ActiveRecord::Migration[5.1]
  def change
    create_table :observations do |t|
      t.datetime :start_time
      t.string :description
      t.boolean :completed
      t.integer :rating
      t.string :notes

      t.timestamps
    end
  end
end
