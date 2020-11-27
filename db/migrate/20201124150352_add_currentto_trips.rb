class AddCurrenttoTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :current, :boolean, default: true
  end
end
