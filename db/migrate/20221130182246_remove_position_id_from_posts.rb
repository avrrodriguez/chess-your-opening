class RemovePositionIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :common_position_id, :integer
  end
end
