class CoupeWaggon < Waggon
  validates :top_places, :bottom_places, presence: true
end
