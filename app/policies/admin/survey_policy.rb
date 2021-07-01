# frozen_string_literal: true

class Admin::SurveyPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
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

  def close?
    user.admin?
  end
end
