require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nick_nameが空では登録できないこと" do
      @user.nick_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick_name can't be blank")
    end

    it "emailが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end

    it "family_nameが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name can't be blank")
    end

    it "family_name_kanaが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
    end

    it 'first_nameが全角でないと登録できないこと' do
      user = build(:user, first_name: "zenkaku")
      user.valid?
      expect(@user.errors[:first_name_kana]).to include("は全角で入力してください")
    end

    it 'family_nameが全角でないと登録できないこと' do
      user = build(:user, family_name: "kana")
      user.valid?
      expect(@user.errors[:family_name]).to include("は全角で入力してください")
    end



    it 'first_name_kanaがカタカナでないと登録できないこと' do
      user = build(:user, first_name_kana: "kana")
      user.valid?
      expect(@user.errors[:first_name_kana]).to include("はカタカナで入力してください")
    end

    it 'family_name_kanaがカタカナでないと登録できないこと' do
      user = build(:user, family_name_kana: "kana")
      user.valid?
      expect(@user.errors[:family_name_kana]).to include("はカタカナで入力してください")
    end

    it "birthが空では登録できないこと" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end


    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
  end
end


