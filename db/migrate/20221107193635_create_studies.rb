class CreateStudies < ActiveRecord::Migration[7.0]
  def change
    create_table :studies do |t|
      t.integer :user_id
      t.integer :opening_id
      t.text :notes
      t.boolean :public, default: "false"

      t.timestamps
    end
  end
end
