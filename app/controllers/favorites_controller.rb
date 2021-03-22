class FavoritesController < ApplicationController
  def create
    @word = Word.find(params[:word_id])
    Favorite.create(user_id: current_user.id, word_id: params[:word_id])
  end

  def destroy
    @word = Word.find(params[:word_id])
    favorite = Favorite.find_by(user_id: current_user.id, word_id: params[:word_id])
    favorite.delete
  end
end
