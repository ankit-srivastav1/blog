class CommentsController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy
  

  def create
    @artical = Artical.find(params[:artical_id])
    @comment = @artical.comments.create(comment_params)
    redirect_to artical_path(@artical)
  end

  def destroy
    @artical = Artical.find(params[:artical_id])
    @comment = @artical.comments.find(params[:id])
    @comment.destroy
    redirect_to artical_path(@artical)
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
