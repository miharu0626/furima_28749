class ShippingsController < ApplicationController

  def new
    @shipping = Shipping.new
  end

  def create
    @shipping = Shipping.new(shipping_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def index
    @shipping = Shipping.new
  end

  private

  def shipping_params
    params.require(:shipping).permit(:post_code, :prefecture_id, :city, :add_num, :bld_name, :phone_num, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      # amount: order_params[:price],  # 商品の値段
      card: shipping_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
