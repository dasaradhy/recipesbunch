class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :chef, index: true, foreign_key: true
      t.json :ingredients
      t.json :steps
      t.string :preparation_time
      t.float :ease_of_preparation
      t.float :taste

      t.timestamps null: false
    end
  end
end
