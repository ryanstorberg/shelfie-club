class UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def index
  #   if !params[:search].blank?
  #     @users = User.where('username LIKE ?', "%#{params[:search]}%")
  #   end
  # end

  def index
    if !params[:search].blank?
      @users = User.where('username ILIKE ?', "%#{params[:search]}%")
    end
  end

  def show
    @user  = User.find_by(id: params[:id])
    @books = @user.books
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to user_path(current_user), notice: 'Add books'
    else
      render 'general/home'
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def log_in(user)
      session[:current_user_id] = user.id
    end

    def logged_in?
      session[:current_user_id]
    end

    def current_user
      User.find_by(id: session[:current_user_id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :avatar)
    end
end
