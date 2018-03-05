class Superhero < ApplicationRecord

  has_one :superpower

  validates :super_name, uniqueness: true

  def superpower_name
    Superpower.find(superpower_id).name
  end

  def superpower_object
    Superpower.find(superpower_id)
  end

end
