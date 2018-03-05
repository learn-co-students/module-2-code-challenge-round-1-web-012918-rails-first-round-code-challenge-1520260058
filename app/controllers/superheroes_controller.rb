class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    get_superhero
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.create(superhero_params)
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

  def get_superhero
    @superhero = Superhero.find(params[:id])
  end

end
