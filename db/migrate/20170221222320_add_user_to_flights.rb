class AddUserToFlights < ActiveRecord::Migration[5.0]
  def change
    add_reference :flights, :user, foreign_key: true
  end
end
