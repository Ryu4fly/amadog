class AddSenderToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :sender
  end
end
