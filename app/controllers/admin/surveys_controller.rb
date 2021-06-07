module Admin
  class SurveysController < Admin::BaseController
    def index
      @surveys = Survey.all
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
      @answer = Survey.find(params[:id]).survey_answers.find(params[:answer_id])
      redirect_to admin_surveys_path if @answer.update(votes: @answer.votes.to_i + 1)
    end

    def destroy
      @survey.destroy if @survey = Survey.find(params[:id])

      redirect_to admin_surveys_path, notice: 'Survey successfully deleted'
    end

    private

    def survey_params
      params.require(:survey).permit(:question, survey_answers_attributes: {})
    end
  end
end
