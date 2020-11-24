class User < ApplicationRecord
  has_many :trips, dependent: :destroy
  has_many :receipts, dependent: :destroy
  has_many :forms, dependent: :destroy

  validates :title, :first_name, :last_name, :address, :passport_no, :passport_country, presence: true
  validates :passport_no, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
