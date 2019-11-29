class SpotsController < ApplicationController
  def index
    @spots = Spot.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
