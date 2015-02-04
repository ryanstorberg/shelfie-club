class RepliesController < ApplicationController

  def create
    @reply = Reply.create(reply_params)
    respond_to do
      if @reply
        format.js { render :create }
      else

      end
    end
  end

  private

    def reply_params
      params.require(:reply).permit(:user_id, :post_id, :content)
    end

end
