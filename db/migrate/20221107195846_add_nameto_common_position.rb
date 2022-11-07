class AddNametoCommonPosition < ActiveRecord::Migration[7.0]
  def change
    add_column :common_positions, :name, :string
  end
end
