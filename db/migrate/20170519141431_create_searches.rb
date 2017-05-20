class CreateSearches < ActiveRecord::Migration[5.0]
  def change
    create_table :searches do |t|
      t.integer :begin_station_id
      t.integer :end_station_id
    end
  end
end
