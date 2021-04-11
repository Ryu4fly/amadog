class AddEndTimeToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :end_time, :time

  end
end
