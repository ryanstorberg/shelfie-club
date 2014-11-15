module SessionsHelper
  def logged_in?
    session[:current_user_id]
  end

  def current_user
    User.find_by(id: session[:current_user_id])
  end
end
