class Users::UsersController < ApplicationController
  def mypage
  end

  def edit
    @user = current_user
  end

  def updateInfo
    @user = current_user
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render users/users/edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:is_deleted)
  end
end
