class SuperheroesController < ApplicationController
  before_action :get_superhero, only: [:edit, :show, :update, :destroy]

  def index
    @superheroes = Superhero.all
    
    if params[:superhero].present?
      @searched = true
    else
      @searched = false
    end
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

  def show

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
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id, :search)
  end

  def get_superhero
    @superhero = Superhero.find(params[:id])
  end

end
