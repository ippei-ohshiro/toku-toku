class SpotsController < ApplicationController
  def index
    @search = Spot.search(params[:q])
    @spots = @search.result.order(id: :desc).page(params[:page]).per(10)
    @count = @spots.count
  end

  def show
    @spot = Spot.find(params[:id])
  end
end
