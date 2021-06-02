module Admin
  class TeamsController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @teams = 'teams will live here'
    end
  end
end
