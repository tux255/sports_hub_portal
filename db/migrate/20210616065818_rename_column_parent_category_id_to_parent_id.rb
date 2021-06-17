class RenameColumnParentCategoryIdToParentId < ActiveRecord::Migration[6.1]
  def change
    rename_column :categories, :parent_category_id, :parent_id
    change_column :categories, :parent_id, :integer, null: true
  end
end
