class AddTotalExclVatToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :receipts, :total_excl_vat, currency: { present: false }
  end
end
