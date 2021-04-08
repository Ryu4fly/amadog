class AddDateToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :date, :date

  end
end
