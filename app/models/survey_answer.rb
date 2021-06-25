# frozen_string_literal: true
class SurveyAnswer < ApplicationRecord
  belongs_to :survey

  validates :answer, length: {
    minimum: 1
  }
end
