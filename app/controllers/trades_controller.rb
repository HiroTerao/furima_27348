class TradesController < ApplicationController
  before_action :correct_user, only: :index

  def index
    @item = Item.find(params[:item_id])
    redirect_to new_user_session_path unless user_signed_in?
  end

  private

  def correct_user
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id
  end
end
