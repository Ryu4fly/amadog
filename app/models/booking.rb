class Booking < ApplicationRecord
  DOGBREEDS = ["Labrador Retriever", "German Shepherd",  "Golden Retriever", "Beagle", "French Bulldog", "Yorkshire Terrier", "Poodle"]
  belongs_to :user
  belongs_to :walker, class_name: "User"

  validates :pet, presence: true, inclusion: { in: DOGBREEDS }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
