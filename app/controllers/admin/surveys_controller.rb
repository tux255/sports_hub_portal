module Admin
  class SurveysController < ApplicationController
    before_action :authenticate_user!
    after_action :verify_authorized

    def index; end
  end
end
