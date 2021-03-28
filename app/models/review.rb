class Review < ApplicationRecord
  belongs_to :user
  belgons_to :reviewer, class_name: 'User'
end
