# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_category, primary_key: :parent_id, class_name: 'Category', optional: true
  has_many :subcategory_posts, through: :subcategories, source: :posts

  has_many :posts
  has_many :banners
  has_many :teams

  scope :top_level, -> { where(parent_id: nil) }

  validates :title, uniqueness: true, presence: true
end
