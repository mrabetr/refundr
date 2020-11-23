class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.date :arrival_date
      t.date :departure_date
      t.string :final_destination
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
