class Users::UsersController < ApplicationController
  before_action :authenticate_user!

  def mypage
    @lists = List.where(user_id: current_user.id).reverse_order.page(params[:page]).per(8)
    @createList = List.new
  end

  def bookmark
    @words = Word.joins(:favorites).select("words.*, favorites.id AS favorite_id").where(favorites: {user_id: current_user.id}).order(favorite_id: "DESC").page(params[:page]).per(10)
  end

  def mylist
    @lists = List.joins(:mylists).select("lists.*, mylists.id AS mylist_id").where(mylists: {user_id: current_user.id}).order(mylist_id: "DESC").page(params[:page]).per(10)
  end

  def edit
    @user = current_user
  end

  def updateInfo
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render action: :edit
    end
  end

  def delete_user
    user = current_user
    user.is_deleted = true
    user.save
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
