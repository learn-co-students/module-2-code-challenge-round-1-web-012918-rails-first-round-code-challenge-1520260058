class SuperpowersController < ApplicationController

  before_action :get_superpower, only: [:show, :edit, :update]

  def index
    @superpowers = Superpower.all
  end

  def show

  end

  private

    def get_superpower
      @superpower = Superpower.all.find_by_id(params[:id])
    end

end
