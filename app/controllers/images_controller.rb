require 'open-uri'
class ImagesController < ApplicationController
  def create
    uploader=MediaUploader.new;
    uploader.store!(params[:file].tempfile)

    render json: {url: uploader.url}
  end

  def show
  end

  def get_image

    image_url=params[:image_url]
    uploader=MediaUploader.new;
    unescaped_image_url=URI.unescape(image_url)
    uploader.store! open(unescaped_image_url)

    render json: {url: uploader.url} 

  end

end
