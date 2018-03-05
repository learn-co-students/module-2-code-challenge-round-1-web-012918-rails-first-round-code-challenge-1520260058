class SuperheroesController < ApplicationController
  before_action :get_superhero, only: [:show, :edit, :update, :destroy]

  def index
    if params[:superpower_name]
      superpower = Superpower.find_by(name: params[:superpower_name])
      @superheroes = Superhero.where(superpower: superpower)
    else
      @superheroes = Superhero.all
    end
  end

  def show
  end

  def new
    @superhero = Superhero.new
  end

  def create
    if @superhero = Superhero.create(superhero_params)
      redirect_to @superhero
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @superhero.update(superhero_params)
      redirect_to @superhero
    else
      render :edit
    end
  end

  def destroy
    @superhero.destroy
    redirect_to superheroes_path
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

  def get_superhero
    @superhero = Superhero.find_by(id: params[:id])
  end
end
