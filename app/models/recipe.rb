class Recipe < ApplicationRecord
  has_one_attached :featured_image
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
end
