require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品登録' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it '商品名が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Item name を入力してください'
      end
      it '商品説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Description を入力してください'
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態が空だと登録できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end
      it '配送料の負担が空だと登録できない' do
        @item.shipping_cost_burden_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost burden can't be blank"
      end
      it '発送元が空だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が空だと登録できない' do
        @item.delivery_days_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery days can't be blank"
      end
      it '販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は300円以上9,999,999円以内の半角数値で入力してください'
      end
      it '販売価格は半角数値のみ登録可能' do
        @item.price = '１１１１'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は300円以上9,999,999円以内の半角数値で入力してください'
      end
      it '画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Image 画像を添付してください'
      end
      it '300未満の値では保存できないこと' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は300円以上9,999,999円以内の半角数値で入力してください'
      end
      it '10000000以上の値では保存できないこと' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price は300円以上9,999,999円以内の半角数値で入力してください'
      end
      it 'ユーザーが紐づいていないと保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
