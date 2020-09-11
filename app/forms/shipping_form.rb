class ShippingForm
  include ActiveModel::Model
 
  attr_accessor :purchase_id, :post_code, :prefecture_id, :city, :add_num, :bld_name, :phone_num, :user_id, :item_id, :token
  validates :user_id, presence: true
  validates :item_id, presence: true
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}, presence: true
  validates :city, presence: true
  validates :add_num, presence: true
  validates :phone_num, format: {with: /\A\d{10,11}\z/}, presence: true
 
 
  validates :prefecture_id, numericality: { other_than: 1 }


  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Shipping.create!(purchase_id: purchase.id, post_code: post_code, prefecture_id: prefecture_id, city: city, add_num: add_num, bld_name: bld_name, phone_num: phone_num)
    
  end
 end