class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = TradeOrder.new
  end

  def create
    @order = TradeOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token, :item_id).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
