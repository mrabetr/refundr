class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.string :shop
      t.string :shop_vat_no
      t.string :shop_address
      t.string :transaction_no
      t.date :date
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
