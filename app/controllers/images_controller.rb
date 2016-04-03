class ImagesController < ApplicationController
  def create
    uploader=MediaUploader.new;
    uploader.store!(params[:file].tempfile)

    render json: {url: uploader.url}
  end

  def show
  end
end
