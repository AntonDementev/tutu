class StationNumberInRoute < ActiveRecord::Migration[5.0]
  def change
    add_column(:railway_stations_routes, :station_number_in_route, :integer)
  end
end
