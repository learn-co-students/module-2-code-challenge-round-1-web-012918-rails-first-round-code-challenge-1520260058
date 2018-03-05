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
    @superhero = Superhero.create(
      name: params[:superhero][:name],
      super_name: params[:superhero][:super_name],
      superpower_id: params[:superpower_id]
    )
    if @superhero.save
      redirect_to @superhero
    else
      render :new
    end
  end

  def destroy
    @superhero = Superhero.find(params[:id])
    @superhero.destroy
    redirect_to superheroes_path
  end

  def filtered
    @superpower = params[:search]
    @superheroes_w_superpower = Superhero.all.select do |sh|
      sh.superpower_id == Superpower.find_by(name: @superpower).id
    end
    render :filtered
  end

end
