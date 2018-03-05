class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    @superpower = Superpower.find(params[:id])
  end

  def new
    @superpower = Superpower.new
  end

  private

  
end
