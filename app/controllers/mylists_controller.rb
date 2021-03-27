class MylistsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    Mylist.create(user_id: current_user.id, list_id: @list.id)
  end

  def destroy
    @list = List.find(params[:list_id])
    mylist = Mylist.find_by(list_id: @list.id, user_id: current_user.id)
    mylist.destroy
  end
end