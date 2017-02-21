class CreateFlights < ActiveRecord::Migration[5.0]
  def change
    create_table :flights do |t|
      t.string :number
      t.integer :capacity
      t.date :date

      t.timestamps
    end
  end
end
