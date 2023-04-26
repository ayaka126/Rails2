class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.date :check_in
      t.date :check_out
      t.integer :how_many_days
      t.integer :how_many_people
      t.integer :total_price

      t.timestamps
    end
  end
end
