# frozen_string_literal: true
class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :category do |t|
      t.string :title
      t.references :parent_category, null: false, foreign_key: { to_table: :category }
      t.timestamps
    end
  end
end
