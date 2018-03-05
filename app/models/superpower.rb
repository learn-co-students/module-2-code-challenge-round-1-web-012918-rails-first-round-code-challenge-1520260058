class Superpower < ApplicationRecord
  validates :name, presence: true
  
  has_many :hero_powers
  has_many :superheroes, through: :hero_powers

end
