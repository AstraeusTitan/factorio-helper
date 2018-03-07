class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :energy_cost, numericality: { greater_than: 0.0 }, presence: true

  belongs_to :user
end
