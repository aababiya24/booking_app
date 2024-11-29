class User < ApplicationRecord

  has_many :bookings, foreign_key: :user_id, dependent: :destroy # Bookings created by this user (as a client)
  has_many :client_bookings, class_name: 'Booking', foreign_key: :photographer_id, dependent: :destroy # Bookings where this user is the photographer

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable

  #roles

  enum role: { client: 'client', photographer: 'photographer' }

  scope :photographers_by_first_name, ->(first_name) {
    photographers.where("first_name LIKE ?", "%#{first_name}%")
  }

  # Scope to retrieve photographers
  scope :photographers, -> { where(role: :photographer) }

  # Method to get full name
  def full_name
    "#{first_name} #{last_name}"
  end

end
