class RenameTypeInResource < ActiveRecord::Migration[7.0]
  def change
    rename_column :resources, :type, :resource_type
  end
end
