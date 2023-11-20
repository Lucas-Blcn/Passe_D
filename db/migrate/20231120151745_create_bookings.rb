class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.text :reviews
      t.integer :rating
      t.boolean :transaction_booked
      t.date :starting_date
      t.date :ending_date
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
