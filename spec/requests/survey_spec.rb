require 'rails_helper'

RSpec.describe 'Surveys' do
  describe 'CRUD for admin/surveys as user' do
    before(:each) do
      sign_in FactoryBot.create(:user, :user)
    end

    it 'redirects to #index' do
      get '/admin/surveys'
      assert_response :redirect
      follow_redirect!
      assert_response :success
      expect(response).to render_template('posts/index')
    end
  end

  describe 'CRUD for admin/surveys as admin' do
    before(:each) do
      sign_in admin
    end

    let(:admin) { FactoryBot.create(:user, :admin) }

    let(:survey_atts) do
      FactoryBot
        .attributes_for(:survey)
        .merge(survey_answers_attributes: {
                 1 => FactoryBot.attributes_for(:survey_answer),
                 2 => FactoryBot.attributes_for(:survey_answer)
               })
    end

    it '#index' do
      get '/admin/surveys'
      assert_response :success
    end

    it '#new' do
      expect(
        get('/admin/surveys/new')
      ).to render_template('surveys/new')
    end

    it '#create' do
      expect do
        post '/admin/surveys',
             params: { survey: survey_atts }
      end.to change { Survey.all.size }.by(1)
    end

    it '#edit' do
      survey = admin.surveys.create(survey_atts)
      expect(
        get('/admin/surveys', params: { survey_id: survey.id })
      ).to render_template('admin/surveys/_survey_preview')
    end

    it 'persisted' do
      question = 'what number?'
      survey = Survey.new(
        question: question,
        start_date: Date.today,
        end_date: Date.tomorrow,
        survey_answers: [
          FactoryBot.build(:survey_answer, answer: '1'),
          FactoryBot.build(:survey_answer, answer: '2')
        ]
      )
      expect(survey.save).to be_truthy
      expect(survey.user_id).to eq(admin.id)
      expect(survey.question).to eq(question)
      expect(survey.survey_answers.pluck(:answer).sort).to eq(%w[1 2])
    end
  end
end
