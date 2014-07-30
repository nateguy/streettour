class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :customer_id
      t.integer :user_id
      t.datetime :booking_date
      t.string :comments

      t.timestamps
    end
  end
end
