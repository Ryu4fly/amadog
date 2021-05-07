class Booking < ApplicationRecord
  DOGBREEDS = ["Labrador Retriever", "German Shepherd", "Golden Retriever", "Beagle", "French Bulldog", "Yorkshire Terrier", "Poodle"]
  belongs_to :user
  belongs_to :walker, class_name: "User"

  validates :pet, presence: true, inclusion: { in: DOGBREEDS }
  validates :date, presence: true
  validates :starting_time, presence: true
  validates :end_time, presence: true
  validates :address, presence: true
  
  # attr_accessible :address , :latitude , :longitude 
  geocoded_by :address 
  after_validation :geocode, if: :will_save_change_to_address?
end
