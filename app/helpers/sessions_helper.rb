module SessionsHelper
  def logged_in?
    !current_user.nil?
  end

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def current_user?(user)
    user == current_user
  end
end
