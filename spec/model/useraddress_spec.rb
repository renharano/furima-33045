require 'rails_helper'
RSpec.describe Useraddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:useraddress, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end
  context '登録できるとき' do
    it "全て入力されていれば登録できる" do
      expect(@order).to be_valid
    end
    it "現像物の記入がなくても登録できる" do
      @order.building_name = ""
      expect(@order).to be_valid
    end
  end
  context '登録できないとき' do
    it "user_idがない場合は登録できないとき" do
      @order.user_id = ""
      @order.valid?
      
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it "item_idがない場合は登録できないとき" do
      @order.item_id = ""
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
    it "tokenがない場合は登録できないとき" do
      @order.token = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it "郵便番号がない場合は登録できないとき" do
      @order.post_code = ""
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Post code can't be blank")
    end
    it "郵便番号-がない場合は登録できないとき" do
      @order.post_code = "1234567"
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "郵便番号が全角の場合は登録できないとき" do
      @order.post_code = "１２３ー４５６７"
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it "住所がない場合は登録できないとき" do
      @order.city = ""
      @order.valid?
      
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it "都道府県が1の場合は登録できないとき" do
        @item.prefecture_id = 1
        @item.valid?
        
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it "電話番号がない場合は登録できないとき" do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号に英数字がある場合は登録できないとき" do
      @order.phone_number = "0123abc45"
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号に-がある場合は登録できないとき" do
      @order.phone_number = "012-2345-6789"
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が全角の場合は登録できないとき" do
      @order.phone_number = "０１２３４５６７８９"
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
    it "電話番号が11桁内でないと登録できないとき" do
      @order.phone_number = "123456789123"
      @order.valid?
      
      expect(@order.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end
