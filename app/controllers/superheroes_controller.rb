class SuperheroesController < ApplicationController
  before_action :set_superhero, only: [:show]
  def index
    @superheroes = Superhero.all
  end

  def show
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(get_params)
    if @superhero.save
      redirect_to @superhero
    else
      render :new
    end
  end

  private
  def set_superhero
    @superhero = Superhero.find(params[:id])
    @superpower = @superhero.superpower
  end
  def get_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
