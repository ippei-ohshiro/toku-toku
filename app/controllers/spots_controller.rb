class SpotsController < ApplicationController
  def index
    @search = Spot.search(params[:q])
    @spots = @search.result.order(id: :desc).page(params[:page]).per(10)
    @count = @spots.count
  end

  def show
    @user = User.find(params[:id])
    @spot = Spot.find(params[:id])
    @comment = @spot.comments.build
    @comments = @spot.comments.page(params[:page]).per(3)
  end
  
end
