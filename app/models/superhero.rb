class Superhero < ApplicationRecord
  belongs_to :superpower

  # validats :super_name, uniqueness: true
  validate :is_unique
  def is_unique
    names = Superhero.all.map{|superhero| superhero.name}
    super_names = Superhero.all.map{|superhero| superhero.super_name}
    if names.include?(self.name) && super_names.include?(self.super_name)
      errors.add(:name, "That superhero is taken")
    end
  end
end
