class Superhero < ApplicationRecord
  belongs_to :superpower

  validates :super_name, uniqueness: true

  def self.search(query)
    if query.present?
      where("name LIKE ?", "%#{query}")
    else
      find(:all)
    end
  end

end
