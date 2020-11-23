class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
