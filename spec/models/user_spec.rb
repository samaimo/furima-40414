require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = '' # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空だと登録できない' do
        @user.email = '' # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'last_nameが空だと登録はできない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空だと登録はできない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'kana_last_nameが空だと登録ができない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end
      it 'kana_first_nameが空だと登録ができない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end
      it '生年月日が空だと登録はできない' do
        @user.birth_day = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'passwordが半角英数字混合でないと登録できない' do
        @user.password = 'password'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_nameが全角日本語でないと登録できない' do
        @user.last_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角の漢字・ひらがな・カタカナで入力してください')
      end

      it 'first_nameが全角日本語でないと登録できない' do
        @user.first_name = 'suzuki'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角の漢字・ひらがな・カタカナで入力してください')
      end
      it 'kana_last_nameが全角カタカナでないと登録ができない' do
        @user.kana_last_name = '中山'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name は全角カタカナで入力してください')
      end
      it 'kana_first_nameが全角カタカナでないと登録ができない' do
        @user.kana_first_name = 'きんに君'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name は全角カタカナで入力してください')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end
