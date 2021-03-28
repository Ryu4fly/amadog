class User < ApplicationRecord
  has_many :bookings
  has_many :bookings_received, class_name: 'Booking', foreign_key: :walker_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
