class RemoveUserFromCategories < ActiveRecord::Migration[6.1]
  def change
    remove_column :categories, :user, :reference
  end
end
