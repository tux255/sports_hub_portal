require 'rails_helper'

# TODO: use FactoryBot for entties here

RSpec.describe Survey, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user, :admin)
    survey = user.surveys.new(FactoryBot.attributes_for(:survey))

    2.times do
      survey.survey_answers.new(FactoryBot.attributes_for(:survey_answer))
    end

    expect(survey).to be_valid
  end

  it 'is not valid with less than two answers' do
    survey = FactoryBot.build(:survey)
    survey.survey_answers.new(FactoryBot.attributes_for(:survey_answer))
    expect(survey).to_not be_valid
  end

  it 'is not valid without a question' do
    survey = FactoryBot.build(:survey)

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
