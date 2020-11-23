class Receipt < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :items

  monetize :total_cents
  monetize :total_excl_vat_cents
end
