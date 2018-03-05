class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true
  validates :super_name, presence: true

  def self.search(term)
    if term
      Superhero.joins(:superpower).where('superpowers.name LIKE ?', "%#{term}%")
    else
      Superhero.all
    end
  end
end
