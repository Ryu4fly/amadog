class AddPetToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :pet, :string
  end
end
