# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Survey do
  describe 'survey validation test' do
    let(:user) { FactoryBot.create(:user, :admin) }

    it 'is valid with valid attributes' do
      expect(
        FactoryBot.build(:survey, user_id: user.id)
      ).to be_valid
    end

    it 'is not valid with one answer' do
      expect(
        FactoryBot.build(:survey, :one_answer, user_id: user.id)
      ).not_to be_valid
    end

    it 'is not valid without question' do
      expect(
        FactoryBot.build(:survey, :no_question, user_id: user.id)
      ).not_to be_valid
    end

    it 'is not valid without a start_date' do
      expect(
        FactoryBot.build(:survey, :no_start_date, user_id: user.id)
      ).not_to be_valid
    end

    it 'is not valid without a end_date' do
      expect(
        FactoryBot.build(:survey, :no_end_date, user_id: user.id)
      ).not_to be_valid
    end

    it 'is not valid if start_date is in the past' do
      expect(
        FactoryBot.build(:survey, :start_date_in_past, user_id: user.id)
      ).not_to be_valid
    end

    it 'persisted' do
      question = 'what number?'
      survey = FactoryBot.build(:survey, question: question, user_id: user.id)

      expect(survey.save).to be_truthy
      expect(survey.user_id).to eq(user.id)
      expect(survey.question).to eq(question)
      expect(survey.survey_answers.pluck(:answer)).to eq(%w[Yes No])
    end
  end
end
