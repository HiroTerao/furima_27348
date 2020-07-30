class TransactionsController < ApplicationController
  before_action :correct_user, only: :index

  def index
    @item = Item.find(params[:item_id])
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  private

  def correct_user
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
