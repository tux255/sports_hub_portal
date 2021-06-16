require 'rails_helper'

RSpec.describe 'Surveys' do
  describe 'GET admin/surveys#index' do
    it 'renders the index for user role admin' do
      sign_in FactoryBot.create(:user, :admin)

      get '/admin/surveys'
      assert_response :success
    end

    it 'redirects to home page for users with role user' do
      sign_in FactoryBot.create(:user, :user)

      get '/admin/surveys'
      assert_response :redirect
      follow_redirect!
      assert_response :success
      expect(response).to render_template('posts/index')
    end
  end

  describe 'GET admin/surveys#new' do
    it 'should render New Survey template' do
      sign_in FactoryBot.create(:user, :admin)

      get '/admin/surveys/new'
      assert_response :success
      expect(response).to render_template('surveys/new')
    end

    it 'should redirect to home page' do
      sign_in FactoryBot.create(:user, :user)

      get '/admin/surveys/new'
      assert_response :redirect
      follow_redirect!
      assert_response :success
      expect(response).to render_template('posts/index')
    end
  end

  describe 'POST /admin/surveys#create' do
    it 'creates survey with two answers' do
      sign_in FactoryBot.create(:user, :admin)

      expect do
        post '/admin/surveys',
             params: {
               survey: FactoryBot.attributes_for(:survey).merge(survey_answers_attributes: {
                                                                  1 => FactoryBot.attributes_for(:survey_answer),
                                                                  2 => FactoryBot.attributes_for(:survey_answer)
                                                                })
             }
      end.to change { Survey.all.size }.by(1)
    end
  end

  describe 'GET /admin/surveys#edit' do
    it 'should render Edit Survey template' do
      user = FactoryBot.create(:user, :admin)
      sign_in user

      survey = user.surveys.create(FactoryBot.attributes_for(:survey)
        .merge(survey_answers_attributes: {
                 1 => FactoryBot.attributes_for(:survey_answer),
                 2 => FactoryBot.attributes_for(:survey_answer)
               }))

      get '/admin/surveys', params: { survey_id: survey.id }

      expect(response).to render_template('admin/surveys/_survey_preview')
    end
  end
end
