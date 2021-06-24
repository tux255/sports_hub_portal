require 'rails_helper'

RSpec.describe 'Categories' do
  describe 'CRUD for admin/categories as admin' do
    before(:each) do
      sign_in admin
    end

    let(:admin) { FactoryBot.create(:user, :admin) }

    # let(:attr) do
    #   { title: 'Category title' }
    # end

    it '#index' do
      get '/admin/categories'
      assert_response :success
    end

    it '#new' do
      expect(
        get('/admin/categories/new')
      ).to render_template('categories/new')
    end

    it '#create' do
      expect do
        post '/admin/categories',
             params: { category: FactoryBot.attributes_for(:category) }
      end.to change { Category.all.size }.by(1)
    end

    it '#edit' do
      category = admin.categories.create(FactoryBot.attributes_for(:category))

      expect(
        get(edit_admin_category_path(category))
      ).to render_template 'admin/categories/edit'
    end

    it '#update' do
      parent_category = FactoryBot.create(:category, user_id: admin.id)
      test_category = FactoryBot.create(:category, user_id: admin.id)

      put "/admin/categories/#{test_category.id}",
          params: { category: { title: 'New title', parent_id: parent_category.id } }

      test_category.reload

      expect(response).to render_template('categories/show')
      expect(test_category.title).to eql 'New title'
      expect(test_category.parent_id).to eql parent_category.id
    end
  end
end
