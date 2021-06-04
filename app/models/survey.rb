class Survey < ApplicationRecord
  has_many :survey_answers, dependent: :destroy

  accepts_nested_attributes_for :survey_answers
end
