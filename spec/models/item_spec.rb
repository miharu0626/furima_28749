require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload("/public/images/test_image.png")
    end

    it 'imageが存在すれば商品出品できること' do
      expect(@item).to be_valid
    end

    it 'nameが空では登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'detailが空では登録できないこと' do
      @item.detail = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'category_idが「---」では登録できないこと' do
      @item.category_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category is not a number")
    end

    it 'item_status_idが「---」では登録できないこと' do
      @item.item_status_id =  "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Item status is not a number")
    end

    it 'shipping_fee_idが「---」では登録できないこと' do
      @item.shipping_fee_id =  "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee is not a number")
    end

    it 'shipping_location_idが「---」では登録できないこと' do
      @item.shipping_location_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping location is not a number")
    end

    it 'shipping_date_idが「---」では登録できないこと' do
      @item.shipping_date_id = "---"
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date is not a number")
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300~¥9,999,999の間であること' do
      @item.price = 15
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end

    it 'priceは半角数字でないと登録できないこと' do
      @item.price = /\A[0-9]+\z/
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid")
    end


  end
end
