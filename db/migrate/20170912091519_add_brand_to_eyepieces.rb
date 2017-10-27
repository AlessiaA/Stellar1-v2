class AddBrandToEyepieces < ActiveRecord::Migration[5.1]
  def change
    add_column :eyepieces, :brand, :string
  end
end
