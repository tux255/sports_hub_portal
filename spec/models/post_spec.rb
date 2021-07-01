# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post do
  describe 'post validation test' do
    before do
      @admin = FactoryBot.build(:user, :admin)
    end

    it 'is valid with valid attributes' do
      expect(@admin.posts.new(FactoryBot.attributes_for(:post))).to be_valid
    end

    it 'is not valid without title' do
      expect(@admin.posts.new(FactoryBot.attributes_for(:post, title: '')))
        .not_to be_valid
    end

    it 'is not valid without body' do
      expect(@admin.posts.new(FactoryBot.attributes_for(:post, content: '')))
        .not_to be_valid
    end
  end
end
