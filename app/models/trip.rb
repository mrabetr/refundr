class Trip < ApplicationRecord
  belongs_to :user
  has_many :receipts
  has_many :forms

  validates :arrival_date, :departure_date, :final_destination, presence: true
  validate :departure_date_after_arrival_date
end
