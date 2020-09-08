class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]
  # ログインしていないユーザーが出品ボタン押下しても、ログインへ連れて行かれる
  before_action :move_to_new, only: [:new]

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
    @items = Item.all.order('created_at DESC')
  end

  # def destroy
  #   @item = Item.find(params[:id])
  #   @item.destroy
  #   if @item.destroy
  #     redirect_to root_path
  #   else
  #     render :new
  #   end
  # end

  # def edit
  # end

  def show
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :item_status_id, :shipping_fee_id, :shipping_location_id, :shipping_date_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # ログインしていないユーザーが出品ボタン押下しても、ログインへ連れて行かれる
  def move_to_new
    redirect_to '/users/sign_in' unless user_signed_in?
  end
end
