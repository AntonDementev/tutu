class TrainAddHeadToTailFlag < ActiveRecord::Migration[5.0]
  def change
    add_column(:trains, :head_to_tail, :boolean)
  end
end
