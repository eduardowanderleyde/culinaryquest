json.extract! recipe, :id, :name, :description, :ingredients, :instructions, :cook_time, :difficulty, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
