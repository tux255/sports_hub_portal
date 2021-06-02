module Admin
  class FooterController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @footer = 'footert content here'
    end
  end
end
