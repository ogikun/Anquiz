class FavoritesController < ApplicationController
  def create
    Favorite.create(user_id: current_user.id, word_id: params[:word_id])
    redirect_back fallback_location: root_path
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, word_id: params[:word_id])
    @favorite.delete
    redirect_back fallback_location: root_path
  end
end
