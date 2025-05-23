class Recipe < ApplicationRecord
  has_one_attached :featured_image
  validates :name, presence: true
end
