class Receipt < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :items
end
