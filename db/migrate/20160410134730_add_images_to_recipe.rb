class AddImagesToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :images, :json
  end
end
