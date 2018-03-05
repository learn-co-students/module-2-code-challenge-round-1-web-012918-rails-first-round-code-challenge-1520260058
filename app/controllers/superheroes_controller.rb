class SuperheroesController < ApplicationController
  before_action :get_superhero, only: [:show, :edit, :update, :destroy]

  def index
    @superheroes = Superhero.search(params[:term])
  end

  def show
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.create(superhero_params)

    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @superhero.update(superhero_params)
      redirect_to superhero_path(@superhero)
    else
      render :edit
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

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id, :term)
  end
end
