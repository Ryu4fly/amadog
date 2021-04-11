class AddStartingTimeToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :starting_time, :time

  end
end
