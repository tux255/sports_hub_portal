# frozen_string_literal: true
class Survey < ApplicationRecord
  has_many :survey_answers, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :survey_answers

  validates :question, presence: true
  validates :end_date, presence: true
  validates :start_date, presence: true
  validate :start_date_validate

  validates :survey_answers, length: {
    minimum: 2,
    too_short: 'must have at least two answers'
  }

  def start_date_validate
    errors.add(:start_date, "can't be in the past") unless start_date.present? && start_date >= Date.today
  end

  def votes
    p survey_answers.sum(:votes)
  end
end
