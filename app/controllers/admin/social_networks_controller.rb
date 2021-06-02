module Admin
  class SocialNetworksController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @social_networks = 'social networks here'
    end
  end
end
