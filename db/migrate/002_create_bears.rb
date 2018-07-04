class CreateBears < ActiveRecord::Migration[5.1]
  def change
    create_table :bears do |t|
      t.integer :weight
      t.integer :zoo_id
      t.string :color
    end
  end
end
