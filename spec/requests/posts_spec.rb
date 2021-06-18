require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'CRUD posts' do
    before(:each) do
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
      # expect(
      #   post(
      #     '/admin/posts',
      #     params: { post: FactoryBot.attributes_for(:post, user_id: user.id) }
      #   )
      # ).to change { Post.all.size }.by(1)
    end

    it '#update' do
    end

    it '#destroy' do
      new_post = user.posts.new(
        title: 'post title',
        body: 'body content'
      )
      expect(new_post.save).to be_truthy
      expect(new_post.destroy).to be_truthy
    end

    it 'persisted' do
      title = 'post title'
      body = 'body content'
      new_post = user.posts.new(
        title: title,
        body: body
      )
      expect(new_post.save).to be_truthy
      expect(new_post.user_id).to eq(user.id)
      expect(new_post.title).to eq(title)
      expect(new_post.body).to eq(body)
    end
  end
end
