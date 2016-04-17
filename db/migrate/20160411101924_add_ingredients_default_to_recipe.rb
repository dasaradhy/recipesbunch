class AddIngredientsDefaultToRecipe < ActiveRecord::Migration
  def change
    change_column_default :recipes, :ingredients, []
  end
end
