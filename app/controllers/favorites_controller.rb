class FavoritesController < ApplicationController
  before_action :skip_authorization

  def create
    @pitch = Pitch.find(params[:pitch_id])
    @favorite = Favorite.new
    @favorite.pitch = @pitch
    @favorite.user = current_user
    @favorite.save!
    redirect_to pitch_path(@pitch)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to pitch_path(@favorite.pitch), status: :see_other
  end

end
