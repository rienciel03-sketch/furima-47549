class ItemsController < ApplicationController

  def index
  end


  private

  def items_params
    params.require(:item).permit(:name, :introduction, :category_id, :condition_id, :shipping_cost__id, :prefecture_id, :shipping_time_id, :price).merge(user_id: current_user.id)
end
