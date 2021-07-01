# frozen_string_literal: true
class CreateSurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_answers do |t|
      t.string :answer

      t.timestamps
    end
  end
end
