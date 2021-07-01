# frozen_string_literal: true
class AddUserToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_foreign_key :surveys, :users
  end
end
