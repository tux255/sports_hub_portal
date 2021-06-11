class SurveyAnswer < ApplicationRecord
  belongs_to :survey

  validate :validate_answers

  def validate_answers
    errors.add(:answer, 'must have at least two answers') unless answer.length > 1
  end
end
