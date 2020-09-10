class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_location

# 空で保存できないようにする
with_options presence: true do
  validates :post_code
  validates :prefecture_id
  validates :city
  validates :add_num
  validates :phone_num
  validates :token
end



  belongs_to :purchase
end
