class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  
  has_many :tickets
  has_many :waggons
    
  def places_info(waggon_category_id)
    waggons_amount = 0
    places_top = 0
    places_bottom = 0
  
    waggons.each do |waggon|
      if waggon.category_id == waggon_category_id
        waggons_amount += 1
        places_top += waggon.top_places
        places_bottom += waggon.bottom_places
      end
    end
    
    { waggons_amount: waggons_amount, places_top: places_top, places_bottom: places_bottom }
    
  end
  
end
