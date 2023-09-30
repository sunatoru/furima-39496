require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品のデータ保存' do
    context '商品が保存できる場合' do
      it 'すべての情報が入力されている場合商品のデータが登録される' do
        expect(@item).to be_valid
      end
    end
    context '商品が保存できない場合' do
      it '画像がない場合保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image 画像を添付してください")
      end
      it '商品名が空の場合保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name は商品名を入力してください")
      end     
      it '商品の説明が空の場合保存できない' do
        @item.item_content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item content は商品の説明を入力してください")
      end
      it 'カテゴリーのジャンル選択が---の場合保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category はカテゴリーを選んでください")
      end
      it '商品状態の選択が---の場合保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition は商品の状態を選んでください")
      end
      it '配送先の選択が---の場合保存できない' do
        @item.delivery_country_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery country は配送先を選んでください")
      end
      it '配達日の選択が---の場合保存できない' do
        @item.delivery_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery date は配達までにかかる日数を選択してください")
      end
      it '配達料金を負担する人の選択が---の場合保存できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge は配達にかかる金額を負担する人を選択してください")
      end
      it '商品の価格が空の場合保存できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は商品の価格を入力してください")
      end
      it '商品の価格が300から9,999,999の範囲外の場合保存できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price は商品の価格は300から9,999,999の範囲内である必要があります")
      end
    end
  end
end
