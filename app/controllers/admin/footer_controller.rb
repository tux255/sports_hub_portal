# frozen_string_literal: true
module Admin
  class FooterController < Admin::BaseController
    def show
      @footer = 'footert content here'
    end
  end
end
