class ImagesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def create
    if params.has_key?(:image)
      @album = Album.find(params[:album_id])
      @image = Image.new(image_params)
      @image.album = @album
      @image.user = @album.user
      if @image.save
        flash[:notice] = "Image added"
        redirect_to album_path(@album)
      else
        flash[:notice] = "Image not added"
        redirect_to album_path(@album)
      end
    else
      flash[:notice] = "Please attach an image"
      redirect_to :back
    end
  end

  def show
    @tag = Tag.new
    @image = Image.find(params[:id])
    @users = User.untagged(@image)
    @album = @image.album
    @tags = @image.tags
    @comment = Comment.new
  end

  def destroy
    @image = Image.find(params[:id])
    if current_user == @image.user
      @image.destroy
      flash[:alert] = "Image gone forever!"
      redirect_to :back
    else
      flash[:alert] = "This is not your image! This image belongs to #{@image.user.username}"
      redirect_to :back
    end

  end

  private
  def image_params
    params.require(:image).permit(:picture)
  end

end
