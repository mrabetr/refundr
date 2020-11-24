class AddCountriestoTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :country, :string
  end
end
