class Instruction < ApplicationRecord
  belongs_to :recipe
  validates :step, :recipe, :body, presence: true
end
