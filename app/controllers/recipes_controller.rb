class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
  end

  def new
    @recipe=Recipe.new
  end

  def edit
    @recipe=Recipe.new
  end

  def create
    recipe=params[:recipe]
    if recipe[:images].present?
      images_to_delete=recipe[:images].select{|image|
        recipe[:steps].all?{|step| step !~ /"#{image}"/}
      }
      recipe[:images]-=images_to_delete;
      images_to_delete.map{|image_to_delete|File.basename(image_to_delete)}.each{|image_to_delete|
        uploader=MediaUploader.new;
        uploader.retrieve_from_store!(image_to_delete);
        uploader.remove!
      }      
    end
    render plain: params.to_s
  end

  def show
  end
end
