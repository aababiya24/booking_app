class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :photographer, class_name: 'User' # Photographer for the booking

  validates :date, presence: true
end
