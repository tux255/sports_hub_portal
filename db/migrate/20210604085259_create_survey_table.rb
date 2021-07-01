# frozen_string_literal: true
class CreateSurveyTable < ActiveRecord::Migration[6.1]
  def change
    create_table :surveys do |t|
      t.boolean :published
      t.string :question

      t.timestamps
    end
  end
end
