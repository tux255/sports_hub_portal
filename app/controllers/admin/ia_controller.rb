# frozen_string_literal: true

module Admin
  class IaController < Admin::BaseController
    def index
      @ia = policy_scope(Category).top_level
    end
  end
end
