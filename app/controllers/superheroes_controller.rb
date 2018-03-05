class SuperheroesController < ApplicationController

  before_action :get_superhero, only: [:show, :edit, :update]

  def index
    @superheroes = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def show

  end

  def create
    @superhero = Superhero.new(hero_params(:name, :super_name))
    if @superhero.valid?
      @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @superhero.update(hero_params(:name, :super_name))
      redirect_to superhero_path(@superhero)
    else
      render :edit
    end
  end

  def destroy

  end

  private

    def get_superhero
      @superhero = Superhero.all.find_by_id(params[:id])
    end

    def hero_params(*args)
      params.require(:superhero).permit(*args)
    end


end
