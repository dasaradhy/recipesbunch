# == Schema Information
#
# Table name: ratings
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  recipe_id           :integer
#  taste               :float
#  ease_of_preparation :float
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  comment             :text
#

class RatingsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :setup, except: [:show]
  def index
  end

  def show
  end

  def new
    @rating=Rating.new
    authorize @rating
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def setup
    @recipe = Recipe.find(params[:recipe_id]) if params[:recipe_id].present?
    @user = current_user
  end
end
