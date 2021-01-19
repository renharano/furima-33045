require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end


  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'nameが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'textが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'categoryが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'statusが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'judgmentが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'prefectureが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'dayが存在すれば登録できる' do
        expect(@item).to be_valid
      end
      it 'priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
  end
  
  context '新規登録できない時' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'categoryが空では登録できない' do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'statusが空では登録できない' do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'judgmnetが空では登録できない' do
        @item.judgment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Judgment can't be blank")
      end
      it 'prefectureが空では登録できない' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'dayが空では登録できない' do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格の範囲が¥300~¥9999999の間でなければ登録できない' do
        @item.price = "10"
        @item.valid?
        expect(@item.errors.full_messages).to include("Judgment can't be blank")
      end
      it '販売価格が半角数字意外であれば登録できない' do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Judgment can't be blank")
      end
   end
end
