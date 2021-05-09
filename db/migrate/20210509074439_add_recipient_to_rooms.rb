class AddRecipientToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :recipient
  end
end
