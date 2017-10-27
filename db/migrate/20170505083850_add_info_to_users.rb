class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :birth, :date
    add_column :users, :subscription_expiration, :date
  end
end
