class Review < ApplicationRecord
  belongs_to :user
  belongs_to :reviewer, class_name: 'User'
end
