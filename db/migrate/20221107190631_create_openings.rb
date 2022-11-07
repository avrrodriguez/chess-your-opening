class CreateOpenings < ActiveRecord::Migration[7.0]
  def change
    create_table :openings do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.string :difficulty
      t.string :variation

      t.timestamps
    end
  end
end
