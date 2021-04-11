class AddTimeToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :time, :time

  end
end
