class CreateZoos < ActiveRecord::Migration[5.1]
  def change
    create_table :zoos do |t|
      t.integer :location_id
      t.integer :square_footage
      t.integer :tonnage_of_straw
      t.integer :tonnage_of_birdfeed
    end
  end
end
