class PostsController < ApplicationController

  def create
    @post = Post.create(post_params)
    respond_to do |format|
      if @post
        format.js { render :index }
      else

      end
    end
  end

  private

    def post_params
      params.require(:post).permit(:user_id, :discussion_id, :content)
    end
end
