class CreateCommonPositions < ActiveRecord::Migration[7.0]
  def change
    create_table :common_positions do |t|
      t.text :description
      t.string :image_url
      t.string :variation
      t.integer :opening_id

      t.timestamps
    end
  end
end
