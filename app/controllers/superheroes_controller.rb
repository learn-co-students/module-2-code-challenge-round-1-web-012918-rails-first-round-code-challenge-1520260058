class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(hero_params(:name, :super_name, :superpower_id))
    if @superhero.save
      redirect_to superheroes_path
    else
      render :new
    end
  end

  def search
    @superpowers = Superpower.search(params[:q])
    @superheroes = []
    @superpowers.each do |power|
      @superheroes = Superhero.where(superpower_id: power.id)
    end
    @superheroes
    render :index
  end


  private

  def get_superhero
    @superhero = Superhero.find(params[:id])
  end

  def hero_params(*args)
    params.require(:superhero).permit(*args)
  end
end
