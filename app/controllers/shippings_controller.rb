class ShippingsController < ApplicationController

  def new
    @shipping = Shipping.new
  end

  def create
    # shipping = Shipping.new(price: shipping_params[:price])
    @shipping = Shipping.new(shipping_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def shipping_params
    params.require(:shipping).permit(:post_code, :prefecture_id, :city, :add_num, :bld_name, :phone_num, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_eb53fa95cb4ae94c42799542"
    Payjp::Charge.create(
      # amount: order_params[:price],  # 商品の値段
      card: shipping_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
