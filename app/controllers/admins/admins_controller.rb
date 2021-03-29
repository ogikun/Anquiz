class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!

  def admin_page
  end

  def end_user_index
    @users = User.all.reverse_order.page(params[:page]).per(30)
  end

  def end_user_update
    user = User.find(params[:id])
    user.update(end_user_params)
    redirect_back fallback_location: root_path
  end

  def end_user
    @user = User.find(params[:id])
    @lists = List.ransack(user_id_eq: params[:id]).result.page(params[:page]).per(30)
  end

  def list_index
    @lists = List.all.reverse_order.page(params[:page]).per(30)
  end

  def list_destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to admins_lists_path
  end

  def list
    @list = List.find(params[:id])
    @createWord = Word.new
    @createTag = Tag.new
    @createComment = Comment.new
    @tags = @list.tags
    @words = @list.words
  end

  def tag_index
    @tags = Tag.all.reverse_order.page(params[:page]).per(30)
  end

  def tag_destroy
    tag = Tag.find(params[:id])
    tag.destroy
    redirect_back fallback_location: root_path
  end

  def search
    if params[:button] == "list"
      @lists = List.ransack(title_or_about_cont: params[:keyword]).result.page(params[:page]).per(30)
      render :list_index
    elsif params[:button] == "end_user"
      @users = User.ransack(name_or_email_cont: params[:keyword]).result.page(params[:page]).per(30)
      render :end_user_index
    else
      @tags = Tag.ransack(tag_cont: params[:keyword]).result.page(params[:page]).per(30)
      render :tag_index
    end
  end

  private

  def end_user_params
    params.require(:user).permit(:name, :email, :is_deleted)
  end
end