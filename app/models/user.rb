class User < ApplicationRecord
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :articles

  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  private

  def set_default_role
    self.role ||= :user
  end

  def create
    @user = User.new(params[:user].permit(:id, :email, :password, :role))
    @user.save
  end
end
