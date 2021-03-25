class Admins::AdminsController < ApplicationController
  def admin_page
  end

  def end_user_index
    @users = User.all
  end

  def end_user
    @user = User.find(params[:id])
  end

  def list_index
    @lists = List.all.reverse_order.page(params[:page]).per(10)
  end

  def list
    @list = List.find(params[:id])
  end

  def tag_index
    @tags = Tag.all
  end

  def search
    if params[:model] == "search_list"
      @lists = List.ransack(title_or_about_cont: params[:keyword]).result
      render :end_user_index
    elsif params[:model] == "search_user"
      @users = User.ransack(name_or_email_cont: params[:keyword]).result
      render :list_index
    else
      @tags = Tag.ransack(tag_cont: params[:keyword]).result
    end
  end
end