class SuperpowersController < ApplicationController
  before_action :get_superpower, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    byebug
    @superpowers = Superpower.all
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(super_hero_params)
    if @superpower.valid?
       @superpower.save
        redirect_to @superpower
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @superpower.update(super_hero_params)
      redirect_to @superpower
    else
      render :edit
    end
  end

  def destroy
    @superpower.destroy
    # redirect_to superheroes_path
  end


  private
  def get_superpower
    @superpower = Superpower.find(params[:id])
  end

  def super_hero_params
    params.require(:superpower).require[:name, :description]
  end

end
