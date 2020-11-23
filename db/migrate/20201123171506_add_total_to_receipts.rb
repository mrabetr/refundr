class AddTotalToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :receipts, :total, currency: { present: false }
  end
end
