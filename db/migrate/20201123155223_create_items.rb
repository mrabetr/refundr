class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :quantity
      t.string :description
      t.references :receipt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
