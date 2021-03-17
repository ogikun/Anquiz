class TaggingsController < ApplicationController
  def destroy
    tagging = Tagging.find_by(list_id: params[:list_id],tag_id: params[:tag_id])
    tagging.destroy
    redirect_back fallback_location: root_path
  end
end
