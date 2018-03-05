class SuperpowersController < ApplicationController

  before_action :set_superpower, only: [:show]
  def index
    @superpowers = Superpower.all
  end

  def show
  end

  def search
    superpower_name = params[:q]
    @superheroes = Superhero.all.select {|sh| Superpower.find(sh.superpower_id).name == superpower_name}
    if @superheroes.any?
      redirect_to superheroes_path
    else
      render :index
    end
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description)
  end

end
