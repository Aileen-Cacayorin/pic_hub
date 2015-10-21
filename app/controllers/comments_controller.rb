class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = Comment.new(comment_params)
    @comment.image = @image
    @comment.user = current_user
    if (@comment.save)
      redirect_to :back
    else
      flash[:alert] = "Something went wrong"
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back

  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end

end
