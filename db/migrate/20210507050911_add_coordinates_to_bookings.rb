class AddCoordinatesToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :latitude, :float
    add_column :bookings, :longitude, :float
  end
end
