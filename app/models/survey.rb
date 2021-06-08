class Survey < ApplicationRecord
  has_many :survey_answers, dependent: :destroy

  accepts_nested_attributes_for :survey_answers

  def votes
    p survey_answers.sum(:votes)
  end
end
