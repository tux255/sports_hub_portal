class User < ApplicationRecord
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :posts
  has_many :surveys
  has_many :categories

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :lockable

  private

  def set_default_role
    self.role ||= :user
  end
end
