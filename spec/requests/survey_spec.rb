require 'rails_helper'

RSpec.describe 'Surveys', type: :request do
  describe 'GET admin/surveys' do
    it 'renders the index for admin/surveys' do
      sign_in User.create(email: "#{rand(50_000)}@example.com")
      get '/admin/surveys'
      assert_response :success
    end
  end
end
