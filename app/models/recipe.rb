class Recipe < ApplicationRecord
  has_one_attached :featured_image
  has_many :recipe_categories, dependent: :destroy
  has_many :categories, through: :recipe_categories
  validates :name, presence: true
end
