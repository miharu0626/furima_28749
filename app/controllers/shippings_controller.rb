class ShippingsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @shipping = ShippingForm.new
  end

  def create
    @shipping = ShippingForm.new(shipping_params)
    if @shipping.valid?
      pay_item
      @shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.permit(:post_code, :prefecture_id, :city, :add_num, :bld_name, :phone_num, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if !@item.purchase.nil? || user_signed_in? && current_user.id == @item.user_id
  end
end
