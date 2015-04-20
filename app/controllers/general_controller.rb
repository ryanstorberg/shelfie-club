class GeneralController < ApplicationController
  def welcome
    if logged_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end

  def search
    if !params[:search].blank?
      @books = Book.search(params[:search], params[:search_size])
      @users = User.search(params[:search], params[:search_size])
    end
  end
end
