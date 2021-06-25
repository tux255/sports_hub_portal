# frozen_string_literal: true
class ChangeCategoryIdAtPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:posts, :category_id, nil)
    change_column_null(:posts, :category_id, true)
  end
end
