module Admin
  class SurveysController < Admin::BaseController
    def index
      @surveys = Survey.all
    end

    def new
      @survey = Survey.new
    end

    def create
      byebug
      @survey = Survey.new(survey_params)
      # params = { survey: { question: 'Is it?', survey_answers_attributes: [{ answer: 'It is!' }] } }

      redirect_to admin_surveys_path, notice: 'Survey successfully created' if @survey.save
    end

    def edit
      @survey = Survey.find(params[:id])
    end

    def vote
      @answer = Survey.find(params[:id]).survey_answers.find(params[:answer_id])
      @answer.update(votes: @answer.votes.to_i + 1)
    end

    private

    def survey_params
      params.require(:survey).permit(:question, :survey_answers)
    end
  end
end
