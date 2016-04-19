class ChangeRecipeEaseOfPreparationToDifficulty < ActiveRecord::Migration
  def change
    rename_column :recipes, :ease_of_preparation, :difficulty
  end
end
