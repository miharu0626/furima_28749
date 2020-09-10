class ShippingsController < ApplicationController

  def new
    @shipping = Shipping.new
  end

  def create
    shipping = Shipping.create(shipping_params)
    if shipping.save
      redirect_to root_path
    else
      render :shipping
    end
  end

  private

  def shipping_params
    params.require(:shipping).permit(:post_code, :prefecture_id, :city, :add_num, :bld_name, :phone_num)

end
