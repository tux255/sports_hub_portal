require 'rails_helper'

RSpec.describe 'Surveys' do
  describe 'GET admin/surveys' do
    it 'renders the index for user role admin' do
      sign_in FactoryBot.create(:admin)

      get '/admin/surveys'
      assert_response :success
    end

    it 'should render New Survey template' do
      sign_in FactoryBot.create(:admin)

      get '/admin/surveys/new'
      assert_response :success
      expect(response).to render_template('surveys/new')
    end

    it 'should redirect to home page' do
      sign_in FactoryBot.create(:user)

      get '/admin/surveys/new'
      assert_response :redirect
      follow_redirect!
      assert_response :success
      expect(response).to render_template('posts/index')
    end

    it 'creates survey with two answers' do
      sign_in FactoryBot.create(:admin)
      count = Survey.all.size
      acount = SurveyAnswer.all.size
      params = { survey: { question: 'What is it?', start_date: Date.today, end_date: Date.tomorrow,
                           survey_answers_attributes: [
                             { answer: 'Do not know' },
                             { answer: 'Something weird' }
                           ] } }

      post '/admin/surveys', params: params

      # TODO: Find out why post does not crate Survey
      # Survey.create(params[:survey])
      assert_response :success
      expect(response).to render_template('admin/surveys/_form')
      expect(Survey.all.size).to eq(count + 1)
      expect(SurveyAnswer.all.size).to eq(acount + 2)
    end

    it 'should render Edit Survey template' do
      sign_in FactoryBot.create(:admin)

      params = { survey: { question: 'What is it?', start_date: Date.today, end_date: Date.tomorrow,
                           survey_answers_attributes: [
                             { answer: 'Do not know' },
                             { answer: 'Something weird' }
                           ] } }

      # post '/admin/surveys', params: params
      Survey.create(params[:survey])
      get '/admin/surveys', params: { survey_id: 1 }
      expect(response).to render_template('admin/surveys/_survey_preview')
      assert_response :success
    end

    it 'redirects to home page for users with role user' do
      sign_in FactoryBot.create(:user)

      get '/admin/surveys'
      assert_response :redirect
      follow_redirect!
      assert_response :success
      expect(response).to render_template('posts/index')
    end

    it 'adds survey' do
    end
  end
end
