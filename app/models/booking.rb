class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :date_start, presence: true
end
