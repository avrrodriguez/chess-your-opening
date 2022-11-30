class RemoveImageUrlFromPositions < ActiveRecord::Migration[7.0]
  def change
    remove_column :common_positions, :image_url, :string
  end
end
