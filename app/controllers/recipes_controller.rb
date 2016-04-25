# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json             default([])
#  steps               :json             default([])
#  preparation_time    :string
#  ease_of_preparation :float
#  taste               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  images              :json             default([])
#

class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    authorize Recipe
  end

  def new
    @recipe=Recipe.new
    authorize @recipe
  end

  def edit
    @recipe=Recipe.find(params[:id])
    authorize @recipe
  end

  def create
    authorize Recipe
    filter_images
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=Chef.where(user_id: current_user.id).first_or_create();
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end

  end

  def update
    @recipe=Recipe.find(params[:id])
    authorize @recipe
    filter_images(@recipe)
    params[:recipe][:steps].each{|step|step.gsub!(/(<p>(<br>)*<\/p>|<br\/?>)*\z/,'')}

    if @recipe.update(recipe_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def show
    @recipe=Recipe.find(params[:id])
    authorize @recipe
  end

private

  def recipe_params
    params.require(:recipe).permit(:name,:preparation_time,:ingredients => [],:steps => [],:images => [])
  end

  def filter_images(recipe=Recipe.new)
    param_images = params.dig(:recipe,:images)
    params[:recipe][:images] = param_images = [] unless param_images.present?

    param_images = (param_images+recipe.images).uniq
    images_to_delete=param_images.select{|image|
      params.dig(:recipe,:steps).all?{|step|
        step !~ /"#{image}"/
      }
    }

    prune_images(images_to_delete);
    param_images -= images_to_delete
  end


  def prune_images(images)
    images.each{|image|
      uploader=MediaUploader.new;
      uploader.retrieve_from_store!(File.basename(image);
      uploader.remove!
    }
  end

end
