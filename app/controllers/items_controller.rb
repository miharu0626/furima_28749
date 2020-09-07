class ItemsController < ApplicationController
  # ログインしていないユーザーが出品ボタン押下しても、ログインへ連れて行かれる
  before_action :move_to_new, only: [:new,]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :item_status_id, :shipping_fee_id, :shipping_location_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  # ログインしていないユーザーが出品ボタン押下しても、ログインへ連れて行かれる
  def move_to_new
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
