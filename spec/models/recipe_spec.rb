require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it "é válido com atributos válidos" do
    recipe = Recipe.new(
      name: "Bolo",
      description: "Delicioso",
      ingredients: "Farinha\nOvo",
      instructions: "Misture tudo.",
      cook_time: 30,
      difficulty: "fácil"
    )
    expect(recipe).to be_valid
  end

  it "é inválido sem nome" do
    recipe = Recipe.new(name: nil)
    expect(recipe).not_to be_valid
  end

  it "é inválido sem ingredientes" do
    recipe = Recipe.new(name: "Teste", ingredients: nil)
    expect(recipe).not_to be_valid
  end

  it "é inválido sem modo de preparo" do
    recipe = Recipe.new(name: "Teste", instructions: nil)
    expect(recipe).not_to be_valid
  end
end 