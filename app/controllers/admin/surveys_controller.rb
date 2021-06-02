module Admin
  class SurveysController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @surveys = 'surveys content'
    end
  end
end
