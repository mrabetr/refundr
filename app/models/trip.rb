class Trip < ApplicationRecord
  belongs_to :user
  has_many :receipts, dependent: :destroy
  has_many :forms, dependent: :destroy

  validates :arrival_date, :departure_date, :final_destination, :country, presence: true
  # validate :departure_date_after_arrival_date

  def country_name
    country_name = ISO3166::Country[country]
    country_name.translations[I18n.locale.to_s] || country_name.name
  end

  def final_destination_name
    destination_name = ISO3166::Country[final_destination]
    destination_name.translations[I18n.locale.to_s] || destination_name.name
  end

  # private

  # def end_date_after_start_date
  #   return xxx if departure_date.blank? || arrival_date.blank?
  #   if departure_date < arrival_date
  #     errors.add(:departure_date, "must be after the arrival date")
  #   end
  # end
end
