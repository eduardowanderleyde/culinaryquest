class Recipe < ApplicationRecord
  has_one_attached :image
  validates :name, :ingredients, :instructions, presence: true
end
