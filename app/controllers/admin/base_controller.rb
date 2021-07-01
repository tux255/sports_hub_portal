# frozen_string_literal: true

module Admin
  class BaseController < ApplicationController
    layout 'admin/admin_layout'
    before_action :authenticate_user!

    def policy_scope(scope)
      super([:admin, scope])
    end

    def authorize(record, query = nil)
      super([:admin, record], query)
    end
  end
end
