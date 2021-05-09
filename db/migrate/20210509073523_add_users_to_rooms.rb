class AddUsersToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :users, foreign_key: true
  end
end
