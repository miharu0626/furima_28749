require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/public/images/test_image.png')
    end

    it 'imageが存在すれば商品出品できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
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
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'item_status_idが「---」では登録できないこと' do
      @item.item_status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Item status must be other than 1')
    end

    it 'shipping_fee_idが「---」では登録できないこと' do
      @item.shipping_fee_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping fee must be other than 1')
    end

    it 'shipping_location_idが「---」では登録できないこと' do
      @item.shipping_location_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping location must be other than 1')
    end

    it 'shipping_date_idが「---」では登録できないこと' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
    end

    it 'priceが空では登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが¥300~¥9,999,999の間であること(下限)' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceが¥300~¥9,999,999の間であること(上限)' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it 'priceは半角数字でないと登録できないこと' do
      @item.price = /\A[0-9]+\z/
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is invalid')
    end
  end
end
