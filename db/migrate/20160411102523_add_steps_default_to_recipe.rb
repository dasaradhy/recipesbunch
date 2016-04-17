class AddStepsDefaultToRecipe < ActiveRecord::Migration
  def change
    change_column_default :recipes, :steps, []
  end
end
