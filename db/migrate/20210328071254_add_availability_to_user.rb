class AddAvailabilityToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :availability, :datetime
  end
end
