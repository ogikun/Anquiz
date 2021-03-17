class TagsController < ApplicationController
  def create
    createTag = Tag.new(params_tag)
    if createTag.save
      Tagging.create(list_id: params[:list_id], tag_id: createTag.id)
      redirect_back fallback_location: root_path
    elsif Tagging.where(list_id: params[:list_id], tag_id: Tag.find_by(tag: createTag.tag).id).empty?
      Tagging.create(list_id: params[:list_id], tag_id: Tag.find_by(tag: createTag.tag).id)
      redirect_back fallback_location: root_path
    else
      redirect_back fallback_location: root_path
    end
  end

  def destroy
  end

  private

  def params_tag
    params.require(:tag).permit(:tag)
  end
end