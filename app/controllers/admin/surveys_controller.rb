module Admin
  class SurveysController < Admin::BaseController
    def index
      @closed_surveys = policy_scope(Survey).where(closed: true)
      @opened_surveys = policy_scope(Survey).where(closed: false)
      # @closed_surveys = Survey.where(closed: true)
      # @opened_surveys = Survey.where(closed: false)

      @survey = policy_scope(Survey).find(params['survey_id']) if params.key?(:survey_id)
      authorize Survey
    end

    def new
      @closed_surveys = Survey.where(closed: true)
      @opened_surveys = Survey.where(closed: false)

      @survey = Survey.new
      @survey.survey_answers << SurveyAnswer.new

      authorize Survey
    end

    def create
      @survey = Survey.new(survey_params)

      if @survey.save
        redirect_to admin_surveys_path(survey_id: @survey.id), notice: 'Survey successfully created'
      else
        render :new
      end
    end

    def edit
      @closed_surveys = policy_scope(Survey).where(closed: true)
      @opened_surveys = policy_scope(Survey).where(closed: false)

      @survey = policy_scope(Survey).find(params[:id])

      authorize Survey
    end

    def update
      @survey = Survey.find(params[:id])
      if @survey.update(survey_params)
        redirect_to admin_surveys_path(survey_id: @survey.id), notice: 'Survey successfully updated'
      else
        render 'edit'
      end
    end

    def destroy
      return unless @survey = policy_scope(Survey).find(params[:id])

      @survey.destroy
      redirect_to admin_surveys_path, notice: 'Survey successfully deleted'

      authorize Survey
    end

    def vote
      @answer = SurveyAnswer.find(params[:answer_id])
      redirect_to admin_surveys_path if @answer.increment(:votes)
    end

    def close
      if (survey = policy_scope(Survey).find(params[:survey_id]))
        survey.toggle!(:closed)
      end

      redirect_to admin_surveys_path,
                  notice: (survey.closed? ? 'Survey successfully closed' : 'Error! Survey not closed')

      authorize Survey
    end

    def publish
      if (survey = Survey.find(params[:survey_id]))
        survey.toggle!(:published)
      end

      redirect_to admin_surveys_path,
                  notice: (survey.published? ? 'Survey successfully published' : 'Error! Survey not published')
    end

    private

    def survey_params
      params.require(:survey).permit(:question, :start_date, :end_date, survey_answers_attributes: {})
    end
  end
end
