class SurveyPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def vote?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
