class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # makes them helper methods and thus available to views
  helper_method :current_user, :logged_in?

  def current_user
    # ||= is memoization - will only perform if @current_user doesn't exist, to stop it querying the database repeatedly
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    # !! makes it a boolean return - ie. if current_user is there, true, if not, false
    !!current_user
  end
end
