class Superhero < ApplicationRecord
  validates :name, presence: true
  validates :super_name, uniqueness: true

  has_one :hero_power
  has_one :superpower, through: :hero_power

  def self.search(term)
    if term.present?
      self.all.select {|hero| hero.superpower.name.downcase.include? (term)}
    else
      self.all
    end
  end

  def superpower_id=(superpower_id)
    self.superpower = Superpower.find(superpower_id)
  end

  def superpower_id
    self.superpower&.name
  end
end
