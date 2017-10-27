class CreateBinoculars < ActiveRecord::Migration[5.0]
  def change
    create_table :binoculars do |t|
      t.string :name
      t.string :brand
      t.text :description
      t.integer :magnifications
      t.text :notes

      t.timestamps
    end
    add_index :binoculars, :name
    add_index :binoculars, :magnifications
  end
end
