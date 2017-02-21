class Flight < ApplicationRecord
  validates :number, presence: true
  validates :capacity, presence: true
  validates :date, presence: true
end
