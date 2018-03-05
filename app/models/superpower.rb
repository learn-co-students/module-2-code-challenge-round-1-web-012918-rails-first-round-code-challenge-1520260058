class Superpower < ApplicationRecord
  has_many :superheroes

  def self.search(q)
    Superpower.where("name LIKE ?", "%#{q}%")
  end

end
