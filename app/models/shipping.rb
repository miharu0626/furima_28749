class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_location

# 空で保存できないようにする
with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :city
  validates :add_num
  validates :phone_num, format: {with: /\A\d{10,11}\z/}
  validates :token
end

  # 各選択が「---」の時は保存できないようにする
  validates :prefecture_id, numericality: { other_than: 1 }


  belongs_to :purchase
end
