class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :walker, class_name: "User"
end
