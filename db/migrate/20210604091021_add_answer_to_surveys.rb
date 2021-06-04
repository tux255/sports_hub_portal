class AddAnswerToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_reference :survey_answers, :survey, null: false, foreign_key: true
  end
end
