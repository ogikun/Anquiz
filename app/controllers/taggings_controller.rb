class TaggingsController < ApplicationController
  def destroy
    @list = List.find(params[:list_id])
    @createTag = Tag.new
    tagging = Tagging.find_by(list_id: params[:list_id],tag_id: params[:tag_id])
    tagging.destroy
  end
end
