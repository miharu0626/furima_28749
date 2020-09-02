class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_location
  belongs_to_active_hash :shipping_date

  #空の投稿を保存できないようにする
  with_options presence: true do
    validates :name
    validates :image
    validates :detail
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  #各選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_fee_id
    validates :shipping_location_id
    validates :shipping_date_id
  end


  belongs_to :user
  has_one :purchase
  has_one_attached :image

end
