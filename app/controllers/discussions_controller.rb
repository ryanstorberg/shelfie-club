class DiscussionsController < ApplicationController

  def create
    @discussion = Discussion.create(discussion_params)
    respond_to do |format|
      if @discussion
        format.js { render :show }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @discussion = Discussion.find(params[:id])
    respond_to do |format|
      if @discussion
        format.js { render :show }
      else

      end
    end
  end

  private

    def discussion_params
      params.require(:discussion).permit(:user_id, :book_id, :opening)
    end

end
