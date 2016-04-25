require 'open-uri'

class MediaManager

  class << self
    def store_file(file)
      uploader=MediaUploader.new
      uploader.store!(file)
      uploader.url
    end

    def store_remote(url)
      uploader=MediaUploader.new
      uploader.store! open(URI.unescape(url))
      uploader.url
    end

    def remove_image(image_url)
      uploader=MediaUploader.new
      uploader.retrieve_from_store!(File.basename(image_url))
      uploader.remove!
    end
  end
end