class StaticPagesController < ApplicationController

 def index
   @albums = Album.all
 end
end
