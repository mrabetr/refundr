class Item < ApplicationRecord
  belongs_to :receipt

  monetize :price_cents
end
