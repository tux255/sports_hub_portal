class DropPostCategories < ActiveRecord::Migration[6.1]
  def change
    drop_table :post_categories
  end
end
