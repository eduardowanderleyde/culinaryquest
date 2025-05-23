class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.text :ingredients
      t.text :instructions
      t.integer :cook_time
      t.string :difficulty

      t.timestamps
    end
  end
end
