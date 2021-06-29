# frozen_string_literal: true

class Team < ApplicationRecord
  belongs_to :category
  has_many :posts

  has_one_attached :team_logo

  validates :name, :category_id, presence: true
end
