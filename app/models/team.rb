# frozen_string_literal: true
class Team < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :posts

  has_one_attached :image

  validates :name, :category_id, presence: true
end
