class CreateWaggons < ActiveRecord::Migration[5.0]
  def change
    create_table :waggons do |t|
      t.integer :category_id
      t.integer :top_places
      t.integer :bottom_places

      t.timestamps
    end
  end
end
