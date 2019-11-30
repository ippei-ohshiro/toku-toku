class ToppagesController < ApplicationController
  def index
    @search = Spot.search(params[:q])
    @spots = @search.result
  end
end
