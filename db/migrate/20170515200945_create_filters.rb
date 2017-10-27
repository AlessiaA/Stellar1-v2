class CreateFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :filters do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
