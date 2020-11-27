class Receipt < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :items, dependent: :destroy

  has_one_attached :photo

  monetize :total_cents
  monetize :total_excl_vat_cents

  # validates :shop, :shop_vat_no, :shop_address, :transaction_no, presence: true
  # validates :date, :total_cents, :total_excl_vat_cents, presence: true
end
