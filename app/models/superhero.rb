class Superhero < ApplicationRecord
  has_one :superpower
  validates :superpower_id, uniqueness: true
  validates :name, uniqueness: true
end
