class Room < ApplicationRecord
  has_many :users

  has_many :room_messages, dependent: :destroy,
    inverse_of: :room

end
