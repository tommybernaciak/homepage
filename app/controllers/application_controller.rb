class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :http_basic_auth, only: :admin

  def mainpage
    @sections = Section.all
  end

  def admin
    @sections = Section.all
  end

  private

  def http_basic_auth
    unless authenticate_with_http_basic { |user, password| user == Rails.application.secrets.admin_user && password == Rails.application.secrets.admin_pass }
      request_http_basic_authentication
    end
  end
end
