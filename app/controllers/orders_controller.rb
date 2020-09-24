class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, :postal_cord, :area_id, :municipality, :place, :building, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_73d8d28a0ab0719c08c987a1"
    Payjp::Charge.create(
      amount: @item.price,
     card: order_params[:token],
     currency:'jpy'
    )
  end


end
