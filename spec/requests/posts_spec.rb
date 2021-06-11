require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'renders index template' do
      get '/'
      expect(response).to render_template('index')
    end
  end
end
