class RemoveImageUrlFromOpenings < ActiveRecord::Migration[7.0]
  def change
    remove_column :openings, :image_url, :string
  end
end
