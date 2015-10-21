class AlbumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_default, only: [:new, :create, :edit, :update, :destroy]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.user = @user

    if (@album.save)
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    @image = Image.new
    @images = @album.images
  end

  private
   def set_default
     @user = current_user

   end

   def album_params
     params.require(:album).permit(:name, :description)
   end

end
