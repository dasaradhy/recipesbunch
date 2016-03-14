class CreateChefs < ActiveRecord::Migration
  def change
    create_table :chefs do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :recommendations, default: 0

      t.timestamps null: false
    end
  end
end
