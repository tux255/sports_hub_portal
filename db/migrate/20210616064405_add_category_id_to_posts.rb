# frozen_string_literal: true
class AddCategoryIdToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :category_id, :integer, default: 0
  end
end
