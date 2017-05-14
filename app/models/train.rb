class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  
  has_many :tickets
  has_many :waggons
  
  def places_amount(waggon_type, places_type)
    waggons.where(type: waggon_type).sum(places_type)    
  end
  
  def sorted_waggons
    if head_to_tail
      waggons.order(:number)
    else
      waggons.order("number DESC")
    end
  end
  
end
