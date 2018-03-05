class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    # byebug
    @superhero = Superhero.find(params[:id])
    @superpower = @superhero.superpower
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)
    if @superhero.save
      redirect_to @superhero
    else
      render :new
    end
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
