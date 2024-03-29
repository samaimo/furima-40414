require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_form = FactoryBot.build(:purchase_form, user_id: user.id, item_id: item.id)
  end


  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@purchase_form).to be_valid
      end
      it '建物名が空欄でも登録できる' do
        @purchase_form.building_name = ""
        expect(@purchase_form).to be_valid
      end
      it "priceとtokenがあれば保存ができること" do
        expect(@purchase_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @purchase_form.token = ""
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Token を入力してください"
      end
      it '郵便番号が空欄の場合は登録できない' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code を入力してください'
      end
      it '郵便番号は「3桁ハイフン4桁」の半角文字列以外の場合は登録できない' do
        @purchase_form.postal_code = 'abcdefg'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code は「3桁ハイフン4桁」の半角文字列で入力してください'
      end
      it '郵便番号は全角の場合は登録できない' do
        @purchase_form.postal_code = '１２３ー５６７８'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code は「3桁ハイフン4桁」の半角文字列で入力してください'
      end
      it '郵便番号は８桁以上は登録できない' do
        @purchase_form.postal_code = '12345678'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code は「3桁ハイフン4桁」の半角文字列で入力してください'
      end
      it '郵便番号は6桁以下は登録できない' do
        @purchase_form.postal_code = '123456'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code は「3桁ハイフン4桁」の半角文字列で入力してください'
      end
      it '郵便番号は3桁半角のハイフン4桁でないと登録できない' do
        @purchase_form.postal_code = '12-34567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Postal code は「3桁ハイフン4桁」の半角文字列で入力してください'
      end
      it '都道府県が空欄だと登録できない' do
        @purchase_form.prefecture_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Prefecture を入力してください'
      end
      it '市区町村が空欄だと登録できない' do
        @purchase_form.city = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'City を入力してください'
      end
      it '番地が空欄だと登録できない' do
        @purchase_form.street_address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Street address を入力してください'
      end
      it '電話番号が空欄だと登録できない' do
        @purchase_form.phone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number を入力してください'
      end
      it '電話番号は、10桁以上11桁以内の半角数値以外の場合は登録できない' do
        @purchase_form.phone_number = '090-1234-1234'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number は電話番号10桁以上11桁以内の半角数値を入力してください'
      end
      it '電話番号は、9桁以下では登録できない' do
        @purchase_form.phone_number = '123456789'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number は電話番号10桁以上11桁以内の半角数値を入力してください'
      end
      it '電話番号は、半角数字以外が含まれている場合、登録できない' do
        @purchase_form.phone_number = '12345abcde'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number は電話番号10桁以上11桁以内の半角数値を入力してください'
      end
      it '電話番号は、全角数字の場合、登録できない' do
        @purchase_form.phone_number = '１２３４５６７８９１０'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number は電話番号10桁以上11桁以内の半角数値を入力してください'
      end
      it '電話番号は、12桁以上では登録できない' do
        @purchase_form.phone_number = 123456789012
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include 'Phone number は電話番号10桁以上11桁以内の半角数値を入力してください'
      end
      it 'user_idが空だと登録できない' do
        @purchase_form.user_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが空だと登録できない' do
        @purchase_form.item_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Item can't be blank"
      end
      it '都道府県が未選択項目(id:1)だと登録できない' do
        @purchase_form.prefecture_id = 1
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include "Prefecture を入力してください"
      end
    end
  end
end