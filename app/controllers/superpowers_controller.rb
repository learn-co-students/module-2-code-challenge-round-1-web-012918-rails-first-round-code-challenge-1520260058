class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
  end

  def self.search(q)
    Superpower.where("name LIKE ?", "%#{q}%")
  end

end
