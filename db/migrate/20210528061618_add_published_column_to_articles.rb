# frozen_string_literal: true
class AddPublishedColumnToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :published, :boolean
  end
end
