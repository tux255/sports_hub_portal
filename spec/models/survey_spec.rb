require 'rails_helper'

RSpec.describe Survey do
  describe 'survey validation test' do
    before(:each) do
      @admin = FactoryBot.build(:user, :admin)
    end

    it 'is valid with valid attributes' do
      expect(@admin.surveys.new(
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
      expect(@admin.surveys.new(
               question: 'Question?',
               start_date: Date.today,
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' }
               }
             )).to_not be_valid
    end

    it 'is not valid without question' do
      expect(@admin.surveys.new(
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
      expect(@admin.surveys.new(
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
      expect(@admin.surveys.new(
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
      expect(@admin.surveys.new(
               question: 'Question?',
               start_date: Date.yesterday,
               end_date: Date.tomorrow,
               survey_answers_attributes: {
                 1 => { answer: 'Yes' },
                 2 => { answer: 'No' }
               }
             )).to_not be_valid
    end
  end
end
