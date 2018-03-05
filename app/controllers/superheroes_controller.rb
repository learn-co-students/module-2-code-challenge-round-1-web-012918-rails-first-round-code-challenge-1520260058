class SuperheroesController < ApplicationController
  before_action :get_superhero, only: [:show, :destroy]

  def index
    @superheroes = Superhero.search(params[:query])
  end

  def show
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.create(super_params)
    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  def destroy
    @superhero.destroy
    redirect_to superheroes_path
  end

  private
  def get_superhero
    @superhero = Superhero.find(params[:id])
  end

  def super_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

end
