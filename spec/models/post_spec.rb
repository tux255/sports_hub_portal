require 'rails_helper'

RSpec.describe Post do
  describe 'post validation test' do
    before(:each) do
      @admin = FactoryBot.build(:user, :admin)
    end

    it 'is valid with valid attributes' do
      expect(@admin.posts.new(FactoryBot.attributes_for(:post))).to be_valid
    end

    it 'is not valid without title' do
      expect(@admin.posts.new(FactoryBot.attributes_for(:post, :with_no_title)))
        .to_not be_valid
    end

    it 'is not valid without body' do
      expect(@admin.posts.new(FactoryBot.attributes_for(:post, :with_no_content)))
        .to_not be_valid
    end
  end
end
