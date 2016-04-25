class ImagesController < ApplicationController

  def create
    authorize :image
    image_url=MediaManager.store_file(params[:file].tempfile)
    render json: {url: image_url}
  end

  def get_image
    authorize :image
    image_url=MediaManager.store_remote(params[:image_url])
    render json: {url: image_url} 
  end

end
