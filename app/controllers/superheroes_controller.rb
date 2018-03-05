class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.search(params[:term])
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  private

  def superhero_params
    params.require(:superhero).permit!
  end
end
