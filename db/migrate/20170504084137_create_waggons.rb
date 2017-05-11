class CreateWaggons < ActiveRecord::Migration[5.0]
  def change
    create_table :waggons do |t|
      t.belongs_to :train
      t.integer :number
      t.integer :top_places
      t.integer :bottom_places
      t.integer :top_side_places
      t.integer :bottom_side_places
      t.integer :seats_places
      t.string :type

      t.timestamps
    end
  end
end
