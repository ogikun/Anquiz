class SearchesController < ApplicationController
  def search
    if params[:button] == "search_list"
      @results = List.ransack(title_cont: params[:keyword], public_status_eq: 1).result.page(params[:page]).per(10)
    else params[:button] == "search_tag"
      tag = Tag.find_by(tag: params[:keyword])
      if tag
        @results = tag.lists.ransack(public_status_eq: 1).result.page(params[:page]).per(10)
      end
    end
  end
end
