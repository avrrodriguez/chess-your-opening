class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :opening_id
      t.integer :common_position_id

      t.timestamps
    end
  end
end
