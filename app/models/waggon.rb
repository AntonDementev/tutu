class Waggon < ApplicationRecord
  belongs_to :train
  
  validates :number, uniqueness: true
  
  before_create :set_number
  
  private
  
  def set_number
    if self.train.waggons.last.present?
      self.number =  self.train.waggons.maximum(:number) + 1
    else
      self.number = 1
    end
  end

end
