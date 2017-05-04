class AddTrainIdToWaggons < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :waggons, :train
  end
end
