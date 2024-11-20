class Movie < ApplicationRecord
  belongs_to :user
  validates :title, :quality, :price, presence: true
end
