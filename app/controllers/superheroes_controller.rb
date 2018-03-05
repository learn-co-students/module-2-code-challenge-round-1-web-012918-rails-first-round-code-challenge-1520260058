class SuperheroesController < ApplicationController

  before_action :set_superhero, only: [:show, :search]
  def index
    @superheroes = Superhero.all
  end

  def new
    @superhero = Superhero.new
  end

  def create
    @superhero = Superhero.new(superhero_params)
    # byebug
    if @superhero.save
      redirect_to superhero_path(@superhero)
    else
      render :new
    end
  end

  def show
  end

  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end

  def set_superhero
    @superhero = Superhero.find(params[:id])
  end

end


# // ☆  rake routes
#        Prefix Verb URI Pattern                Controller#Action
#   superpowers GET  /superpowers(.:format)     superpowers#index
#    superpower GET  /superpowers/:id(.:format) superpowers#show
#   superheroes GET  /superheroes(.:format)     superheroes#index
#               POST /superheroes(.:format)     superheroes#create
# new_superhero GET  /superheroes/new(.:format) superheroes#new
#     superhero GET  /superheroes/:id(.:format) superheroes#show
