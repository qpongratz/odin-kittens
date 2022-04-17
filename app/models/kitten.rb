class Kitten < ApplicationRecord
  validates :name, :age, :cuteness, :softness, presence: true
  validates :cuteness, :softness, numericality: { in: 1..10 }
  validates :age, numericality: { only_integer: true }
end
