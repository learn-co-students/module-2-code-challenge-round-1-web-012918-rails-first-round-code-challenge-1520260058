class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true

  def self.search(query)
    if query
      Superhero.joins(:superpower).where('SUPERPOWERS.NAME LIKE ?', "%#{query}%")
    else
      self.all
    end
  end


end
