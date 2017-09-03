class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def me
    @title = action_name.humanize
    @about_me = StaticContent.get_body('me')
    @work = StaticContent.get_body('work')
  end

  def admin_only
    redirect_to '/' unless admin_signed_in?
  end
end
