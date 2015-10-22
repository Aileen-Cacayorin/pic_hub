class TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)
    @image = Image.find(params[:image_id])
    @tag.image = @image
    if @tag.save
      flash[:notice] = "Tag added"
      redirect_to :back
    else
      flash[:alert] = "Person not tagged"
      redirect_to :back
    end
  end

  private
  def tag_params
    params.require(:tag).permit(:user_id, :image_id)
  end

end
