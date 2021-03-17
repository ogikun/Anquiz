class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @createComment = Comment.new
  end

  def create
    @createList = List.new(params_list)
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
    @createWord = Word.new
  end

  def update
    @list = List.find(params[:id])
    if @list.update(params_list)
      redirect_to edit_list_path(params[:id])
    else
      render edit_list_path
    end
  end

  private

  def if_input_blank(input)
    if input == ""
      input = "未設定"
    end
  end

  def params_list
    params.require(:list).permit(:user_id, :title, :about, :public_status)
  end
end