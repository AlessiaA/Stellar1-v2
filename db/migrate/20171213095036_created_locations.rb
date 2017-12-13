class CreatedLocations < ActiveRecord::Migration[5.1]
  def change
	 create_table :locations do |t|
      t.string :name
      t.decimal :latitude
	  t.decimal :longitude
	  t.integer :altitude
	  t.integer :bortle
	  t.decimal :sqm
      
	  t.timestamps
    end
  
  end
end
