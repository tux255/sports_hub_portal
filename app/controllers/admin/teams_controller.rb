# frozen_string_literal: true

module Admin
  class TeamsController < Admin::BaseController
    def index
      @teams = Team.all
    end

    def show
      @team = Team.find(params[:id])
    end

    def new
      @team = Team.new
    end

    def create
      @team = Team.new(team_params)

      if @team.save
        render :edit, notice: 'Team successfully created'
      else
        render :edit
      end
    end

    private

    def team_params
      params.require(:team).permit(:name, :category_id, :team_logo)
    end
  end
end
