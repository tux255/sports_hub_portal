# frozen_string_literal: true
class ChangeUserIdColumnToSurveys < ActiveRecord::Migration[6.1]
  def change
    change_column :surveys, :user_id, :integer, null: false
  end
end
