# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit

  private

  def user_not_authorized
    flash['warning'] = 'You are not authorized'
    redirect_to request.referer || root_path
  end
end
