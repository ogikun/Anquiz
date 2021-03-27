class ListsController < ApplicationController
  before_action :authenticate_user!,{only: [:edit]}
  def show
    @list = List.find(params[:id])
    @createComment = Comment.new
    @tags = @list.tags
    @words = @list.words
  end

  def create
    @createList = List.new(list_params)
    @createList.user_id = current_user.id
    @createList.public_status = 0
    @createList.title = if_input_blank(@createList.title)
    @createList.about = if_input_blank(@createList.about)
    if @createList.save
      redirect_to edit_list_path(@createList.id)
    else
      redirect_to mypage_path
    end
  end

  def edit
    @list = List.find(params[:id])
    if @list.user_id == current_user.id
      @createWord = Word.new
      @createTag = Tag.new
      @createComment = Comment.new
      @tags = @list.tags
      @words = @list.words
    else
      redirect_to mypage_path
    end
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to edit_list_path(params[:id])
    else
      render edit_list_path
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to mypage_path
  end

  private

  def if_input_blank(input)
    if input == ""
      input = "未設定"
    else
      input = input
    end
  end

  def list_params
    params.require(:list).permit(:user_id, :title, :about, :public_status)
  end
end