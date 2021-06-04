module Admin
  class SurveysController < Admin::BaseController
    def show
      @surveys = Survey.all
    end
  end
end
