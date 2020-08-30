class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :shipping_location
  belongs_to_active_hash :shipping_date

  #空の投稿を保存できないようにする
  with_options presence: true, do
    validates :name
    validates :image
    validates :detail
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  #各選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 }, do
    validates :category
    validates :item_status
    validates :shipping_fee
    validates :shipping_location
    validates :shipping_date
  end


  belongs_to :user
  has_one :purchase

end
