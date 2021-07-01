# frozen_string_literal: true
class Banner < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_one_attached :image

  validates :image, presence: true
end
