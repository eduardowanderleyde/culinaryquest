# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'open-uri'
require 'json'

puts 'Buscando receitas da TheMealDB...'
url = "https://www.themealdb.com/api/json/v1/1/search.php?s="
response = URI.open(url).read
meals = JSON.parse(response)["meals"]

if meals
  meals.each do |meal|
    ingredientes = (1..20).map { |i| meal["strIngredient#{i}"] }.compact.reject(&:empty?).join("\n")
    instructions = meal["strInstructions"] || ""
    recipe = Recipe.create!(
      name: meal["strMeal"],
      description: instructions[0..100] + "...",
      ingredients: ingredientes,
      instructions: instructions,
      cook_time: rand(10..60),
      difficulty: ["fácil", "médio", "difícil"].sample
    )
    if meal["strMealThumb"].present?
      file = URI.open(meal["strMealThumb"])
      recipe.image.attach(io: file, filename: "#{meal['strMeal']}.jpg")
    end
    puts "Criada: #{recipe.name}"
  end
else
  puts 'Nenhuma receita encontrada na API.'
end
