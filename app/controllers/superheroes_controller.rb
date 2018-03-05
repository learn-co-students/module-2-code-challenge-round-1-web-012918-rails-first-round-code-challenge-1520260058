class SuperheroesController < ApplicationController

before_action :get_superhero, only: [:show]

  def index
    @superheroes = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def create
  @superhero = Superhero.new(superhero_params)
  if @superhero.valid?
    @superhero.save
    redirect_to superhero_path(@superhero)
  else
    render :new
  end

  end

  def show

  end

  def filter
    #take search term from index
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

  def get_superhero
    @superhero = Superhero.find(params[:id])
  end

end
