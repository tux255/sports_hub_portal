# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'CRUD posts' do
    before do
      sign_in user
    end

    let(:user) { FactoryBot.create(:user, :admin) }

    it '#index' do
      expect(
        get('/admin/posts')
      ).to render_template('index')
    end

    it '#show' do
      post = user.posts.create(FactoryBot.attributes_for(:post))

      expect(
        get("/posts/#{post.id}")
      ).to render_template('posts/show')
    end

    it '#new' do
      expect(
        get('/admin/posts/new')
      ).to render_template('posts/new')
    end

    it '#create' do
      expect do
        post('/admin/posts',
             params: { post: FactoryBot.attributes_for(:post, user_id: user.id) })
      end.to change { Post.all.size }.by(1)
    end

    it '#update' do
    end

    it '#destroy' do
      new_post = FactoryBot.create(:post)
      expect(
        delete(:posts, params: { id: new_post.id })
      ).to be_truthy
    end

    it 'persisted' do
      new_post = FactoryBot.create(:post, :with_image, title: 'post title', content: 'some content')

      expect(new_post).to be_valid
      expect(new_post.user_id).to eq(user.id)
      expect(new_post.title).to eq(title)
      expect(new_post.content.to_plain_text).to eq(body)
      expect(new_post.image).to be_attached
    end
  end
end
