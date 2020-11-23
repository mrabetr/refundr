class Form < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_one_attached :document
end
