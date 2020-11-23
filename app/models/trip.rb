class Trip < ApplicationRecord
  belongs_to :user
  has_many :receipts
  has_many :forms
end
