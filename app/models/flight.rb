class Flight < ApplicationRecord
  validates :number, presence: true
  validates :capacity, presence: true
  validates :date, presence: true
  validates :origin, presence: true
  validates :destination, presence: true
  validates :aircraft, presence: true

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
end
