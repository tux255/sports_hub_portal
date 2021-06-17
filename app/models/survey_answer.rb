class SurveyAnswer < ApplicationRecord
  belongs_to :survey

  validates :answer, length: {
    minimum: 1
  }
end
