class User < ApplicationRecord
  has_many :bookings
  has_many :bookings_received, class_name: 'Booking', foreign_key: :walker_id
  has_many :reviews
  has_many :reviews_written, class_name: 'Review', foreign_key: :reviewer_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
