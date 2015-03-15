class GeneralController < ApplicationController
  def home
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end
end
