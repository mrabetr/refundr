class User < ApplicationRecord
  has_many :trips
  has_many :receipts
  has_many :forms

  validates :title, :first_name, :last_name, :address, :passport_no, :passport_country, presence: true
  validates :passport_no, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
