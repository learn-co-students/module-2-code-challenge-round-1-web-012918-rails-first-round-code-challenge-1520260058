class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show]
  def index
    @superpowers = Superpower.all
  end

  def show
  end

  def search
    keyword = params[:q]
    @superpower = Superpower.find_by(name: keyword)
  end

  private
  def set_superpower
    @superpower = Superpower.find(params[:id])
  end
end
