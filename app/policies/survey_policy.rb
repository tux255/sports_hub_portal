class SurveyPolicy < ApplicationPolicy
  def index?
    beybug
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end
