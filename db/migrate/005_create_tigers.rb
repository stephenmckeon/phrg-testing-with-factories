class CreateTigers < ActiveRecord::Migration[5.1]
  def change
    create_table :tigers do |t|
      t.integer :zoo_id
      t.integer :number_of_spots
      t.integer :weight
    end
  end
end
