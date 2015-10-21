class StaticPagesController < ApplicationController

 def index
   @images = Image.all
   @albums = Album.all
 end
end
