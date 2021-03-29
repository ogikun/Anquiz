class HomesController < ApplicationController
  def top
   @lists = List.where(public_status: 1).reverse_order.page(params[:page]).per(8)
  end
end
