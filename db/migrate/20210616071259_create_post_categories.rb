# frozen_string_literal: true
class CreatePostCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :post_categories do |t|
      t.string :title
      t.references :parent, null: false, default: 0, foreign_key: { to_table: :post_categories }

      t.timestamps
    end
  end
end
