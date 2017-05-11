class EconomyWaggon < Waggon
  validates :top_places, :bottom_places, :top_side_places, :bottom_side_places, presence: true
end
