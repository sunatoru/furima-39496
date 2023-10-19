require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    end
    context '商品が購入できる場合' do
      it 'すべての情報を正しく入力していれば商品を購入できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が入っていなくても任意入力なので商品を購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end
    context '商品が購入できない場合' do
      it '郵便番号が空の場合' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県名が選択されていない場合' do
        @order_address.delivery_country_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Delivery country は配送先を選んでください'
      end
      it '市区町村の欄が空の場合' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'City は市町村区を記入してください'
      end
      it '番地の欄が空の場合' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Address は番地を記入してください'
      end
      it '電話番号の欄が空の場合' do
        @order_address.telephone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number は数字のみかつ10桁以上11桁以下の電話番号を入力してください'
      end
      it '郵便番号に-(ハイフン)がない場合' do
        @order_address.postal_code = '8930000'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)'
      end
      it '郵便番号の-(ハイフン)の前が3桁の数字じゃない場合' do
        @order_address.postal_code = '43-999032'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code はハイフン(-)の前が3桁とハイフン(-)の後が4桁の数字でないと無効です'
      end
      it '郵便番号の-(ハイフン)後が4桁の数字じゃない場合' do
        @order_address.postal_code = '434-00077'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code はハイフン(-)の前が3桁とハイフン(-)の後が4桁の数字でないと無効です'
      end
      it '郵便番号に数字以外の入力がある場合' do
        @order_address.postal_code = 'テスト'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Postal code is invalid. Include hyphen(-)',
                                                               'Postal code はハイフン(-)の前が3桁とハイフン(-)の後が4桁の数字でないと無効です'
      end
      it '電話番号の欄に-(ハイフン)が含まれる場合' do
        @order_address.telephone_number = '090-3333-3333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number は数字のみかつ10桁以上11桁以下の電話番号を入力してください'
      end
      it '電話番号が10桁未満の場合' do
        @order_address.telephone_number = '090333333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number は数字のみかつ10桁以上11桁以下の電話番号を入力してください'
      end
      it '電話番号が11桁より大きい場合' do
        @order_address.telephone_number = '090333333332222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number は数字のみかつ10桁以上11桁以下の電話番号を入力してください'
      end
      it '電話番号の欄に文字が含まれる場合' do
        @order_address.telephone_number = '0909999999だ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include 'Telephone number は数字のみかつ10桁以上11桁以下の電話番号を入力してください'
      end
      it 'tokenが空の場合' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが紐づいていない場合' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'item_idが紐づいていない場合' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
