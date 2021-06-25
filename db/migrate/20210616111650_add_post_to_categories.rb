# frozen_string_literal: true
class AddPostToCategories < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :posts, :categories
  end
end
