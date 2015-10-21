class ImagesController < ApplicationController

  def index
    @album = Album.find(params[:album_id])
    @images = @album.images
  end

  def new
    @image = Image.new
  end

  def create
    @album = Album.find(params[:album_id])
    @image = Image.new(image_params)
    @image.album = @album
    @image.user = @album.user
    if @image.save
      redirect_to album_path(@album)
    else
      flash[:notice] = "Image not added"
      redirect_to :back
    end
  end

  private
  def image_params
    params.require(:image).permit(:picture)
  end

end
