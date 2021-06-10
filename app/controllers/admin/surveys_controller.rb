module Admin
  class SurveysController < Admin::BaseController
    def index
      @surveys = Survey.all

      @survey = Survey.find(params['survey_id']) if params.key?(:survey_id)
    end

    def new
      @survey = Survey.new
      @survey.survey_answers << SurveyAnswer.new
    end

    def create
      @survey = Survey.new(survey_params)

      redirect_to admin_surveys_path, notice: 'Survey successfully created' if @survey.save
    end

    def edit
      @survey = Survey.find(params[:id])
    end

    def vote
      @answer = SurveyAnswer.find(params[:answer_id])
      redirect_to admin_surveys_path if @answer.increment(:votes)
    end

    def destroy
      return unless @survey = Survey.find(params[:id])

      @survey.destroy
      redirect_to admin_surveys_path, notice: 'Survey successfully deleted'
    end

    private

    def survey_params
      params.require(:survey).permit(:question, survey_answers_attributes: {})
    end
  end
end
