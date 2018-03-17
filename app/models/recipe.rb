class Recipe < ApplicationRecord
  validates :name, presence: true
  validates :energy_cost, numericality: { greater_than: 0.0 }, presence: true

  belongs_to :user
  has_many :ingredients, dependent: :destroy

  default_scope { order(:name) }
  scope :base, -> { where(modded: false) }
  scope :modded, -> { where(modded: true) }
  scope :owned_by, -> (user) { where(user: user) }
  scope :browseable_for, -> (user) { base.or owned_by(user) }

  def inputs
    ingredients.select { |i| i.input? }
  end

  def outputs
    ingredients.select { |i| !i.input? }
  end
end
