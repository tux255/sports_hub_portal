# frozen_string_literal: true
class RenameCategoryToCategories < ActiveRecord::Migration[6.1]
  def change
    rename_table :category, :categories
  end
end
