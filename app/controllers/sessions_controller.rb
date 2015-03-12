class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:current_user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.new
      redirect_to root_path, notice: "Email or password is incorrect"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
