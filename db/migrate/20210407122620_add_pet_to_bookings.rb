class AddPetToBookings < ActiveRecord::Migration[6.1]
  def change

    add_column :bookings, :pet, :string
  end
end
