class Users::UsersController < ApplicationController
  def mypage
    @lists = List.where(user_id: current_user.id).page(params[:page]).per(8)
    @createList = List.new
  end

  def bookmark
    @words = current_user.words.page(params[:page]).per(10)
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

  private

  def user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end
