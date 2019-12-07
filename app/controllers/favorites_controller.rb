class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    spot = Spot.find(params[:spot_id])
    current_user.like(spot)
    flash[:success] = 'お気に入り登録をしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    spot = Spot.find(params[:spot_id])
    current_user.unlike(spot)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: root_path)
  end
end
