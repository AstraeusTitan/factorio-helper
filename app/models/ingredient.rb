class Ingredient < ApplicationRecord
  validates :name, presence: true
  validates :amount, numericality: { greater_than: 0 }, presence: true

  belongs_to :recipe
end
