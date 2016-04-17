class AddImagesDefaultToRecipe < ActiveRecord::Migration
  def change
    change_column_default :recipes, :images, []
  end
end
