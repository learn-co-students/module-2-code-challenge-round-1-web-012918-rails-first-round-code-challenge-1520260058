class SuperpowersController < ApplicationController
  before_action :get_superpower, only: [:edit, :show, :update, :destroy]

  def index
    @superpoweres = Superpower.all
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    if @superpower.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  def show

  end

  def edit

  end

  def update
    if @superpower.update(superpower_params)
      redirect_to superpower_path(@superpower)
    else
      render :edit
    end
  end

  def destroy
    @superpower.destroy
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name, :description)
  end

  def get_superpower
    @superpower = Superpower.find(params[:id])
  end
end
