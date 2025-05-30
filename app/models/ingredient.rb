class Ingredient < ApplicationRecord
  belongs_to :recipe
  validates :value, :unit, :name, :recipe, presence: true
end
