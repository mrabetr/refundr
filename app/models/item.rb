class Item < ApplicationRecord
  belongs_to :receipt
  

  monetize :price_cents

  validates :quantity, :description, :price, presence: true
end
