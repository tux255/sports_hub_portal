# frozen_string_literal: true
class AddVotesColumnToSurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :survey_answers, :votes, :number
  end
end
