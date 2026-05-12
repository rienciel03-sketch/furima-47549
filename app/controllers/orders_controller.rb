class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :prevent_self_purchase, only: [:index, :create]

  def index
    @orderaddress = OrderAddress.new
  end

  def create
    @orderaddress = OrderAddress.new(order_params)
    if @orderaddress.valid?
      @orderaddress.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:postcode, :prefecture_id, :municipality, :address, :building_name, :phone_number).merge(
      user_id: current_user.id,
      item_id: params[:item_id],
      token: params[:token]
    )
  end

  def prevent_self_purchase
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end
end
