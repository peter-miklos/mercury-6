class Flight < ApplicationRecord
  validates :number, presence: true
  validates :capacity, presence: true
  validates :date, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :aircraft, presence: true
end
