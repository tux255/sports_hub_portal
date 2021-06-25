# frozen_string_literal: true
module Admin
  class HomeController < Admin::BaseController
    def index
      @home_content = policy_scope(Category).all
    end

    def show
      @home_content = 'some home content'
    end
  end
end
