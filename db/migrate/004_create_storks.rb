class CreateStorks < ActiveRecord::Migration[5.1]
  def change
    create_table :storks do |t|
      t.integer :zoo_id
      t.integer :bill_length
      t.integer :wing_span
      t.string :color
    end
  end
end
