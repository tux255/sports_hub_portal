# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Surveys' do
  describe 'CRUD for admin/surveys as user' do
    before do
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
    before do
      sign_in admin
    end

    let(:admin) { FactoryBot.create(:user, :admin) }

    let(:survey_atts) do
      FactoryBot.attributes_for(:survey)
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
             params: { survey: FactoryBot.attributes_for(:survey) }
      end.to change { Survey.all.size }.by(1)
    end

    it '#edit' do
      survey = FactoryBot.create(:survey)
      expect(
        get('/admin/surveys', params: { survey_id: survey.id })
      ).to render_template('admin/surveys/_survey_preview')
    end
  end
end
