class Train < ApplicationRecord
  belongs_to :route, optional: true
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id, optional: true
  
  has_many :tickets
  has_many :waggons
  
  attr_reader :waggons1_amount, :waggon1_places_amount_top, :waggon1_places_amount_bot, :waggons2_amount, :waggon2_places_amount_top, :waggon2_places_amount_bot
  
  def update_values
    @waggons1_amount = 0
    @waggon1_places_amount_top = 0
    @waggon1_places_amount_bot = 0
    @waggons2_amount = 0
    @waggon2_places_amount_top = 0
    @waggon2_places_amount_bot = 0

    waggons.each do |waggon|
      if waggon.category_id == 1
        @waggons1_amount += 1
        @waggon1_places_amount_top += waggon.top_places
        @waggon1_places_amount_bot += waggon.bottom_places
      elsif waggon.category_id == 2
        @waggons2_amount += 1
        @waggon2_places_amount_top += waggon.top_places
        @waggon2_places_amount_bot += waggon.bottom_places
      end
    end
  end
  
end
