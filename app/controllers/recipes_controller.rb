# == Schema Information
#
# Table name: recipes
#
#  id                  :integer          not null, primary key
#  chef_id             :integer
#  ingredients         :json             default([])
#  steps               :json
#  preparation_time    :string
#  ease_of_preparation :float
#  taste               :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  name                :string
#  images              :json
#

class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
  end

  def new
    @recipe=Recipe.new
  end

  def edit
    @recipe=Recipe.find(params[:id])
  end

  def create
    recipe=params[:recipe]
    if recipe[:images].present?
      puts 'Here 1'
      images_to_delete=recipe[:images].select{|image|
        recipe[:steps].all?{|step| step !~ /"#{image}"/}
      }
      puts "imagestodelete: #{images_to_delete}"
      recipe[:images]-=images_to_delete;
      puts "imagestodeleteagain : #{recipe[:images]}"
      images_to_delete.map{|image_to_delete|File.basename(image_to_delete)}.each{|image_to_delete|
        uploader=MediaUploader.new;
        uploader.retrieve_from_store!(image_to_delete);
        uploader.remove!
      }      
    end
    puts "recipe_params= #{recipe_params}"
    @recipe=Recipe.new(recipe_params)
    @recipe.chef=Chef.where(user_id: current_user.id).first_or_create();
    if @recipe.save
      render 'show'
    else
      render 'new'
    end

  end

  def update
    @recipe=Recipe.find(params[:id])
    recipe=params[:recipe]
    recipe[:images]||=[]
    recipe[:images]=(recipe[:images]+@recipe.images).uniq
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
    recipe[:steps].each{|step|step.gsub!(/(<p>(<br>)*<\/p>|<br\/?>)*\z/,'')}

    if @recipe.update(recipe_params)
      render 'show'
    else
      render 'edit'
    end
  end

  def show
    @recipe=Recipe.find(params[:id])
  end

private

  def recipe_params
    params.require(:recipe).permit(:name,:preparation_time,:ingredients => [],:steps => [],:images => [])
  end

end
