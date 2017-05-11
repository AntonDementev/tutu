class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  
  has_many :tickets
  has_many :waggons
  
  def places_amount(waggon_type, places_type)
    sum = 0
    waggons.each do |waggon|
      if waggon_type == waggon.type && waggon[places_type]
        sum += waggon[places_type]
      end
    end
    sum
  end
  
end
