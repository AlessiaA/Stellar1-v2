class AddObservativeSessionToObservations < ActiveRecord::Migration[5.1]
  def change
    add_reference :observations, :observative_session, index: true
  end
end
