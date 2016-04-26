class HomeController < ApplicationController
  def index
    authorize :home
    @recent_recipes = Recipe.order('created_at desc').limit(30)
    @tastiest_recipes = Recipe.order('taste desc').limit(30)
    @easiest_recipes = Recipe.order('ease_of_preparation desc').limit (30)
  end
end
