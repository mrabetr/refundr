class Receipt < ApplicationRecord
  belongs_to :trip
  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items, update_only: true, allow_destroy: true

  has_one_attached :photo

  monetize :total_cents
  monetize :total_excl_vat_cents


  validates :shop, :shop_vat_no, :shop_address, :transaction_no, presence: true
  validates :date, :total_cents, :total_excl_vat_cents, presence: true

  def total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    self.total_cents = total
  end

end
