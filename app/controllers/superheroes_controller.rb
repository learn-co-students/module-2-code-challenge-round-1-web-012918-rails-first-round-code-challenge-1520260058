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
    @superhero = Superhero.new(superhero_params)
    @superhero.superpower = Superpower.find(params[:superhero][:superpower])

    if @superhero.valid?
      @superhero.save
      redirect_to @superhero
    else
      render :new
    end
  end

  def search
    @superpower = params[:superpower]
    @superheroes = Superhero.all.select do |superhero|
                    superhero.superpower.name == params[:superpower]
                  end
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name)
  end
end
