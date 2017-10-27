class CreateEyepieces < ActiveRecord::Migration[5.0]
  def change
    create_table :eyepieces do |t|
      t.string :name
      t.decimal :focal_length
      t.decimal :ocular
      t.decimal :apparent_fov
      t.decimal :size
      t.text :description
      t.text :notes

      t.timestamps
    end
    add_index :eyepieces, :name
    add_index :eyepieces, :focal_length
    add_index :eyepieces, :ocular
    add_index :eyepieces, :apparent_fov
    add_index :eyepieces, :size
  end
end
