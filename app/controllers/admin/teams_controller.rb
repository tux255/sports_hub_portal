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

    private

    def team_params
      params.require(:team).permit(:name)
    end
  end
end
