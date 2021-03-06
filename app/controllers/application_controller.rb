class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  check_authorization unless: :devise_controller?
  respond_to :html, :js

  layout 'layout'

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end
end
