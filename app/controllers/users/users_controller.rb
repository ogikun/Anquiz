class Users::UsersController < ApplicationController
  def mypage
    @lists = List.where(user_id: current_user.id)
    @createList = List.new
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
    params.require(:user).permit(:name,:is_deleted)
  end
end
