class TagsController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @createTag = Tag.new
    createTag = Tag.new(params_tag)
    if createTag.save
      Tagging.create(list_id: params[:list_id], tag_id: createTag.id)
    elsif Tagging.where(list_id: params[:list_id], tag_id: Tag.find_by(tag: createTag.tag).id).empty?
      Tagging.create(list_id: params[:list_id], tag_id: Tag.find_by(tag: createTag.tag).id)
    end
  end

  private

  def params_tag
    params.require(:tag).permit(:tag)
  end
end