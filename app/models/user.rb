class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many :forms, dependent: :destroy

  validates :title, :first_name, :last_name, :address, :passport_no, :passport_country, presence: true
  validates :passport_no, uniqueness: true

  def passport_country_name
    country = ISO3166::Country[passport_country]
    country.translations[I18n.locale.to_s] || country.name
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
