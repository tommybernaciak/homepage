class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def me
    @title = action_name.humanize
    @about_me = StaticContent.about_me
    @work = StaticContent.work
  end
end
