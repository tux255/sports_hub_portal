class Category < ApplicationRecord
  belongs_to :user

  has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id', dependent: :destroy
  belongs_to :parent_category, class_name: 'Category', optional: true
  has_many :subcategory_posts, through: :subcategories, source: :posts

  has_many :posts, foreign_key: 'category_id'
  has_many :banners

  scope :top_level, -> { where(parent_id: nil) }

  validates :title, uniqueness: true, presence: true
end
