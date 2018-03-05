class Superhero < ApplicationRecord
  validates :name, presence: true
  validates :super_name, uniqueness: true
  
  belongs_to :superpower
end
