class AddTimesInRoutes < ActiveRecord::Migration[5.0]
  def change
    add_column(:railway_stations_routes, :time_to_station, :string)
    add_column(:railway_stations_routes, :time_from_station, :string)
  end
end
