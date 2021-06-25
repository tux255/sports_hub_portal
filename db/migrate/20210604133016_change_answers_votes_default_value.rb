# frozen_string_literal: true
class ChangeAnswersVotesDefaultValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:survey_answers, :votes, 0)
  end
end
