class Movie < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :title, :quality, :price, presence: true
end
