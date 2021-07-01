# frozen_string_literal: true
class ChangeVotesColumnTypeAtSurveyAnswers < ActiveRecord::Migration[6.1]
  def change
    change_column :survey_answers, :votes, :integer
  end
end
