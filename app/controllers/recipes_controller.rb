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

  def show
  end
end
