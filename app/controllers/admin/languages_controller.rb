module Admin
  class LanguagesController < ApplicationController
    layout 'admin/admin_layout'

    def show
      @languages = 'few languages here'
    end
  end
end
