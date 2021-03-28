class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.datetime :booking_time
      t.string :address
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.refernces :walker_id

      t.timestamps
    end
  end
end
