# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category do
  let(:user) { FactoryBot.create(:user, :admin) }

  context 'when title is empty' do
    let(:no_title_category) do
      Category.new(title: '')
    end

    it 'not valid' do
      expect(no_title_category.valid?).to be false
    end

    it 'not save' do
      expect(no_title_category.save).to be false
    end
  end

  context 'when title present' do
    let(:valid_category) do
      Category.new(title: 'Category title')
    end

    it 'valid' do
      expect(valid_category.valid?).to be_truthy
    end

    it 'save' do
      expect(valid_category.save).to be_truthy
    end
  end

  context 'when create subcategory' do
    it 'is created' do
      sub_title = 'Subcategory title'
      cat = Category.create!(title: 'Main category')
      subcat = cat.subcategories.new(title: sub_title)

      expect(subcat.save).to be_truthy
      expect(subcat.parent_id).to eq(cat.id)
      expect(subcat.title).to eq(sub_title)
    end
  end

  context 'assign post to category' do
    it 'is assigned' do
      category = Category.new(title: 'Category')
      post = category.posts.new(title: 'Post title', content: 'Post content', category_id: category.id,
                                user_id: user.id)
      expect(post.save).to be_truthy
      expect(post.category_id).to eq(category.id)
    end
  end
end
