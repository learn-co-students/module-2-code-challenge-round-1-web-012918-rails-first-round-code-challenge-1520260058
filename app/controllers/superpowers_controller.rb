class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end

  def show
    get_superpower
  end

  private

  def superpower_params
  end

  def get_superpower
    @superpower = Superpower.find(params[:id])
  end
end
