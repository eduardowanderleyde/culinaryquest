require 'rails_helper'

RSpec.describe "Navegação de receitas", type: :system do
  before do
    Recipe.create!(
      name: "Bolo de Teste",
      description: "Um bolo de teste.",
      ingredients: "Farinha\nOvo",
      instructions: "Misture tudo.",
      cook_time: 30,
      difficulty: "fácil"
    )
  end

  it "usuário vê a lista de receitas" do
    visit recipes_path
    expect(page).to have_content("Bolo de Teste")
  end

  it "usuário vê detalhes de uma receita" do
    visit recipes_path
    click_link "Jogar esta receita"
    expect(page).to have_content("Modo de Preparo")
    expect(page).to have_content("Passo 1:")
  end
end 