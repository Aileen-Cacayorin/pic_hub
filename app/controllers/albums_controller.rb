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

  def destroy
    @album = Album.find(params[:id])
    if current_user == @album.user
      @album.destroy
      redirect_to user_path(@user)
    else
      flash[:alert] = "This is not your album! This album belongs to #{@album.user.username}"
      redirect_to :back
    end
  end

  private
   def set_default
     @user = current_user

   end

   def album_params
     params.require(:album).permit(:name, :description)
   end

end
