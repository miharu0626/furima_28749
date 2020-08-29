class ItemsController < ApplicationController
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
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :text)
  end
end
