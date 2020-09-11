class Shipping < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :purchase
  belongs_to_active_hash :shipping_location
end
