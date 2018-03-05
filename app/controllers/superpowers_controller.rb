class SuperpowersController < ApplicationController

  before_action :get_superpower, only: [:show]

    def index
      @superpowers = Superpower.all
    end

    def new
      @superpower = Superpower.new
    end

    def create
    @superpower = Superpower.new(superpower_params)
    if @superpower.valid?
      @superpower.save
      redirect_to superpower_path(@superpower)
    else
      render :new
    end

    end

    def show

    end


    private

    def superpower_params
      params.require(:superpower).permit(:name, :description)
    end

    def get_superpower
      @superpower = Superpower.find(params[:id])
    end

end
