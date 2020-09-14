require 'rails_helper'

RSpec.describe ShippingForm, type: :model do
  describe '#create' do
    before do
      @seller = FactoryBot.create(:user)
      @buyer = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('/public/images/test_image.png')
      @item.save
      @shipping_form = FactoryBot.build(:shipping_form, user_id: @buyer.id, item_id: @item.id)
      sleep(5)
    end

    it 'post_codeと、city、add_num、phone_numが存在すれば登録できること' do
      expect(@shipping_form).to be_valid
    end

    it 'post_codeが空では登録できないこと' do
      @shipping_form.post_code = nil
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include("Post code can't be blank")
    end

    it 'post_codeが半角のハイフンを含んだ正しい形式でないと登録できないこと' do
      @shipping_form.post_code = '1066137'
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include('Post code is invalid')
    end

    it 'cityが空では登録できないこと' do
      @shipping_form.city = nil
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include("City can't be blank")
    end

    it 'cityが全角日本語でないと保存できないこと' do
      @shipping_form.city = 'tokyo'
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include('City is invalid')
    end

    it 'add_numが空では登録できないこと' do
      @shipping_form.add_num = nil
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include("Add num can't be blank")
    end

    it 'bld_nameは空でも登録できること' do
      @shipping_form.bld_name = nil
      expect(@shipping_form).to be_valid
    end

    it 'phone_numが空では登録できないこと' do
      @shipping_form.phone_num = nil
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include("Phone num can't be blank")
    end

    it 'phone_numにはハイフンは不要で、11桁もしくは10桁であること' do
      @shipping_form.phone_num = '03-3581-4321'
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include('Phone num is invalid')
    end

    it 'prefecture_idが「---」では登録できないこと' do
      @shipping_form.prefecture_id = 1
      @shipping_form.valid?
      expect(@shipping_form.errors.full_messages).to include('Prefecture must be other than 1')
    end
  end
end
