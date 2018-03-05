class Superhero < ApplicationRecord
  belongs_to :superpower
  validates :super_name, uniqueness: true

    # superpower
    def superpower_name
      Superpower.find(self.superpower_id).name
    end

    def superpower_object
      Superpower.find(self.superpower_id)
    end

end
