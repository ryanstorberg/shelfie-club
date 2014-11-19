class GeneralController < ApplicationController
  def home
    @user = User.new
  end
end
