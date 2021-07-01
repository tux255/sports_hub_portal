# frozen_string_literal: true
class AddUserIdToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :user_id, :integer, null: false
  end
end
