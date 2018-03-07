class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :energy_cost, numericality: { greater_than: 0.0 }, presence: true

  belongs_to :user
  has_many :ingredients

  def inputs
    ingredients.select { |i| i.input? }
  end

  def outputs
    ingredients.select { |i| !i.input? }
  end
end
