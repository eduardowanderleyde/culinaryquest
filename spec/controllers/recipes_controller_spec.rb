require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:valid_attributes) do
    {
      name: "Bolo",
      description: "Delicioso",
      ingredients: "Farinha\nOvo",
      instructions: "Misture tudo.",
      cook_time: 30,
      difficulty: "fácil"
    }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  describe "GET #index" do
    it "retorna sucesso" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "retorna sucesso" do
      recipe = Recipe.create! valid_attributes
      get :show, params: { id: recipe.id }
      expect(response).to be_successful
    end
  end
end 