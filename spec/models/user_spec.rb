require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nicknameとemail、passwordとpassword_confirmation、family_name、given_name、family_name_kana、given_name_kana、birth_dayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password_confirmationが空では登録できないこと' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = '12345'
      @user.password_confirmation = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'emailは@がないと登録できないこと' do
      @user.email = 'test.co.jp'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'family_nameが空では登録できないこと' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it 'given_nameが空では登録できないこと' do
      @user.given_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name can't be blank")
    end

    it 'family_name_kanaが空では登録できないこと' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it 'given_name_kanaが空では登録できないこと' do
      @user.given_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Given name kana can't be blank")
    end

    it 'family_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.family_name = /\A[ぁ-んァ-ン一-龥]/
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    it 'given_nameが全角（漢字・ひらがな・カタカナ）でないと登録できないこと' do
      @user.given_name = /\A[ぁ-んァ-ン一-龥]/
      @user.valid?
      expect(@user.errors.full_messages).to include('Given name is invalid')
    end

    it 'family_name_kanaがカタカナでないと登録できないこと' do
      @user.family_name_kana = /\A[ァ-ヶー－]+\z/
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'given_name_kanaがカタカナでないと登録できないこと' do
      @user.given_name_kana = /\A[ァ-ヶー－]+\z/
      @user.valid?
      expect(@user.errors.full_messages).to include('Given name kana is invalid')
    end

    it 'birth_dayが空では登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
