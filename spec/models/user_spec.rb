require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation,last_nameとfirst_name,kanalast_name.が存在すれば登録できる" do
        @user = FactoryBot.build(:user)
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠が含まないと登録できない" do
        @user.email = 'abc-abc'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが半角英数字でないと登録できない" do
        @user.password = "あ亜アaaa"
        @user.password_confirmation = "あ亜アaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameが全角でないと登録できない" do
        @user.last_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameが全角でないと登録できない" do
        @user.first_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "kanalast_nameが空だと登録できない" do
        @user.kanalast_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanalast name can't be blank")
      end
      it "kanalast_nameがカタカナ以外だと登録できない" do
        @user.kanalast_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanalast name is invalid")
      end
      it "kanalast_nameがカタカナ以外だと登録できない" do
        @user.kanalast_name = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanalast name is invalid")
      end
      it "kanalast_nameがカタカナ以外だと登録できない" do
        @user.kanalast_name = "亜亜亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanalast name is invalid")
      end
      it "kanafirst_nameが空だと登録できない" do
        @user.kanafirst_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name can't be blank")
      end
      it "kanafirst_nameがカタカナ以外だと登録できない" do
        @user.kanafirst_name = "aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it "kanafirst_nameがカタカナ以外だと登録できない" do
        @user.kanafirst_name = "亜亜亜"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it "kanafirst_nameがカタカナ以外だと登録できない" do
        @user.kanafirst_name = "あああ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Kanafirst name is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end

