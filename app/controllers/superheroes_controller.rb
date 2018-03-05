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
      if @superhero.save
        redirect_to superheroes_path
      else
        @superhero.errors.add(:name)
    # @superhero = Superhero.create(superhero_params)
        render new_superhero_path
    end
  end

  def search
    @superhero = Superhero.new
    @search_name = params[:q]
    @superpower = Superpower.find_by(name: params[:q])
      if @superpower
        @superheroes_with_power = Superhero.all.select{|superhero| superhero.superpower_id == @superpower.id}
      end
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end
end
