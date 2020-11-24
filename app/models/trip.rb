class Trip < ApplicationRecord
  belongs_to :user
  has_many :receipts
  has_many :forms

  validates :arrival_date, :departure_date, :final_destination, presence: true
  # validate :departure_date_after_arrival_date

  # private

  # def end_date_after_start_date
  #   return xxx if departure_date.blank? || arrival_date.blank?
  #   if departure_date < arrival_date
  #     errors.add(:departure_date, "must be after the arrival date")
  #   end
  # end
end
