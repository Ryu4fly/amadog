class AddCommentToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :comment, :string

  end
end
