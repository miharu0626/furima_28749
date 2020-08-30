class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show]

  def index
    @item = Item.all
  end

  def new
    @Item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
  end

  def edit
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
