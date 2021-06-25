# frozen_string_literal: true
class AddClosedColumnToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :closed, :boolean, default: false
  end
end
