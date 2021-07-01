# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category, optional: true
  has_many :comments

  has_one_attached :image
  has_rich_text :content

  validates :title, presence: true, uniqueness: true
  validates :content, presence: true
end
