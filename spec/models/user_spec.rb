require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    
    context '新規登録できるとき' do
      it "emailとpasswordとpassword_confirmationとbirth_dayが存在すれば登録でき ること" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる"do
        @user.password = "a123456"
        @user.password_confirmation = "a123456"
        expect(@user).to be_valid
      end
      it "nameの値が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "last_nameの値が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "first_nameの値が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "last_name_kanaの値が存在すれば登録できること" do
        expect(@user).to be_valid
      end
      it "first_name_kanaの値が存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録できない時' do
    it "nicknameが空では登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end 
    it "重複したemailが存在する場合登録できない" do
      @user.save
      @user2 = FactoryBot.build(:user)
      @user2.email = @user.email
      @user2.valid?
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "emailに＠が含まれていなければ登録できない"do
    end
    it "passwordが5文字以下であれば登録できない"do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordに半角英数字が含まれていなければ登録できない"do
    end
    it "passwordとpassword_confirmationが不一致では登録できないこと" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dayが空では登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
