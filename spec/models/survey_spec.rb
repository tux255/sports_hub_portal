# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Survey do
  describe 'survey validation test' do
    let(:user) { FactoryBot.create(:user, :admin) }

    it 'is valid with valid attributes' do
      expect(user.surveys.new(
               question: 'Question?',
               start_date: Date.today,
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' },
                 2 => { answer: 'No' }
               }
             )).to be_valid
    end

    it 'is not valid with one answer' do
      expect(user.surveys.new(
               question: 'Question?',
               start_date: Date.today,
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' }
               }
             )).to_not be_valid
    end

    it 'is not valid without question' do
      expect(user.surveys.new(
               question: '',
               start_date: Date.today,
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' },
                 2 => { answer: 'No' }
               }
             )).to_not be_valid
    end

    it 'is not valid without a start_date' do
      expect(user.surveys.new(
               question: 'Question?',
               start_date: '',
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' },
                 2 => { answer: 'No' }
               }
             )).to_not be_valid
    end

    it 'is not valid without a end_date' do
      expect(user.surveys.new(
               question: 'Question?',
               start_date: Date.today,
               end_date: '',
               survey_answers_attributes: {
                 1 => { answer: 'Yes' },
                 2 => { answer: 'No' }
               }
             )).to_not be_valid
    end

    it 'is not valid if start_date is in the past' do
      expect(user.surveys.new(
               question: 'Question?',
               start_date: Date.yesterday,
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' },
                 2 => { answer: 'No' }
               }
             )).to_not be_valid
    end

    it 'persisted' do
      question = 'what number?'
      survey = user.surveys.new(
        question: question,
        start_date: Date.today,
        end_date: Date.tomorrow,
        survey_answers: [
          FactoryBot.build(:survey_answer, answer: '1'),
          FactoryBot.build(:survey_answer, answer: '2')
        ]
      )
      expect(survey.save).to be_truthy
      expect(survey.user_id).to eq(user.id)
      expect(survey.question).to eq(question)
      expect(survey.survey_answers.pluck(:answer).sort).to eq(%w[1 2])
    end
  end
end
