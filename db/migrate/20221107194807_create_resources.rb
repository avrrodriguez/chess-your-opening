class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.integer :opening_id
      t.string :link
      t.string :type

      t.timestamps
    end
  end
end
