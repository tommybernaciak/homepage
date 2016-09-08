class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :http_basic_auth, only: [:mainpage, :admin]

  def mainpage ; end

  def admin ; end

  def blog ; end

  def contact ; end

  private

  def http_basic_auth
    unless authenticate_with_http_basic { |user, password| user == Rails.application.secrets.admin_user && password == Rails.application.secrets.admin_pass }
      request_http_basic_authentication
    end
  end
end
