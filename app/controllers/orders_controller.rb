class OrdersController < ApplicationController

   def index
    @item = Item.find(params[:id])
    @orderaddress = OrderAddress.new
   end

end
