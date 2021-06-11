require 'rails_helper'

RSpec.describe Survey, type: :model do
  it 'is valid with valid attributes' do
    survey = Survey.new(question: 'Is this thing works?', start_date: Date.today, end_date: Date.tomorrow)
    survey.survey_answers.new(answer: 'yes')
    survey.survey_answers.new(answer: 'no')
    expect(survey).to be_valid
  end

  it 'is not valid with less than two answers' do
    survey = Survey.new(question: 'Is this thing works?', start_date: Date.today, end_date: Date.tomorrow)
    survey.survey_answers.new(answer: 'single answer')
    expect(survey).to_not be_valid
  end

  it 'is not valid without a question' do
    survey = Survey.new(question: nil, start_date: Date.today, end_date: Date.tomorrow)
    expect(survey).to_not be_valid
  end

  it 'is not valid without a start_date' do
    survey = Survey.new(question: 'Is this thing works?', start_date: nil, end_date: Date.tomorrow)
    expect(survey).to_not be_valid
  end

  it 'is not valid without a end_date' do
    survey = Survey.new(question: 'Is this thing works?', start_date: Date.today, end_date: nil)
    expect(survey).to_not be_valid
  end

  it 'is not valid if start_date is in the past' do
    survey = Survey.new(question: 'Is this thing works?', start_date: Date.yesterday, end_date: Date.tomorrow)
    expect(survey).to_not be_valid
  end
end
