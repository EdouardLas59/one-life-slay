class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :date_start, presence: true#"":date_end, :pickup_place,"" presence: true
end
