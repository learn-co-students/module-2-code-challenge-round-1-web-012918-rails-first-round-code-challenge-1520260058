class SuperheroesController < ApplicationController
  before_action :get_hero, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @superheroes = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(hero_params)
    if @superhero.valid?
       @superhero.save
        redirect_to @superhero
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @superhero.update(hero_params)
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

  def get_hero
    @superhero = Superhero.find(params[:id])
  end

  def hero_params
    params.require(:superhero).require[:name, :super_name, :superpower_id]


  end

end
