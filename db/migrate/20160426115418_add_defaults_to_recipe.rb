class AddDefaultsToRecipe < ActiveRecord::Migration
  def change
    change_column_default :recipes, :taste, 0
    change_column_default :recipes, :ease_of_preparation, 0
  end
end
