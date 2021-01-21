require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


    context '新規登録できるとき' do
      it '全て入力されていれば登録できる' do
        expect(@item).to be_valid
      end
    end
  
  
  context '新規登録できない時' do
      it 'nameがない場合は登録できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'categoryが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'statusが1では登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'judgmnetが1では登録できない' do
        @item.judgment_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Judgment must be other than 1")
      end
      it 'prefectureが1では登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'dayが1では登録できない' do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it 'priceが空では登録できない' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が¥300~¥9999999の間でなければ登録できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格が299円のときは登録できない'do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格が10000000円のときは登録できない'do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格が半角数字意外であれば登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格は全角文字では登録できないこと' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格は半角英数混合では登録できないこと' do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '販売価格は半角英語だけでは登録できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it '画像がないと登録できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
  end
end
