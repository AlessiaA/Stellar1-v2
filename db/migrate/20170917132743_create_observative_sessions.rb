class CreateObservativeSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :observative_sessions do |t|
      t.string :name
      t.integer :category
      t.datetime :start
      t.datetime :end
      t.integer :antoniadi
      t.integer :pickering
      t.integer :sky_transparency

      t.timestamps
    end

    add_reference :observative_sessions, :user, foreign_key: true
  end
end
