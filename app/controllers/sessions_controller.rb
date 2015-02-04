class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
