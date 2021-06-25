# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Survey do
  describe 'survey validation test' do
    let(:user) { FactoryBot.create(:user, :admin) }

    it 'is valid with valid attributes' do
      expect(
        FactoryBot.create(:survey)
      ).to be_valid
    end

    it 'is not valid with one answer' do
      expect(
        FactoryBot.create(:survey, :one_answer)
      ).not_to be_valid
    end

    it 'is not valid without question' do
      expect(
        FactoryBot.create(:survey, :no_question)
      ).not_to be_valid
    end

    it 'is not valid without a start_date' do
      expect(
        FactoryBot.create(:survey, :no_start_date)
      ).not_to be_valid
    end

    it 'is not valid without a end_date' do
      expect(
        FactoryBot.create(:survey, :no_end_date)
      ).not_to be_valid
    end

    it 'is not valid if start_date is in the past' do
      expect(
        FactoryBot.create(:survey, :start_date_in_past)
      ).not_to be_valid
    end

    it 'persisted' do
      question = 'what number?'
      survey = FactoryBot.create(:survey, question: question)

      expect(survey.save).to be_truthy
      expect(survey.user_id).to eq(user.id)
      expect(survey.question).to eq(question)
      expect(survey.survey_answers.pluck(:answer).sort).to eq(%w[1 2])
    end
  end
end
