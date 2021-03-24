class SearchesController < ApplicationController
  def search
    if params[:model] == "search_list"
      @results = List.ransack(title_cont: params[:keyword], public_status_eq: 1).result.page(params[:page]).per(10)
    else params[:model] == "search_tag"
      tag = Tag.find_by(tag: params[:keyword])
      if tag
        @results = tag.lists.ransack(public_status_eq: 1).result.page(params[:page]).per(10)
      end
    end
  end
end
