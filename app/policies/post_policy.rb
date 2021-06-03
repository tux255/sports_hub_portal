class PostPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == post.user
  end

  def destroy?
    return true if user.present? && user == post.user
  end

  private

  def post
    record
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.try(:admin?)
        scope.all
      else
        scope.where(published: true)
      end
    end

    private

    attr_reader :user, :scope
  end
end