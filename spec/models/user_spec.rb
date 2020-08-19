require 'rails_helper'
describe User do
    before do
      @user = FactoryBot.build(:user)
    end

 describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できること" do
      expect(user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nick_nameが空では登録できない" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick_name can't be blank")
      end

      it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "first_nameが空では登録できない" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
      end

      it "family_nameが空では登録できない" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name can't be blank")
      end

      it "family_name_kanaが空では登録できない" do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_name_kana can't be blank")
      end

      it 'first_nameが全角でないと登録できない' do
      @user = build(:user, first_name: "zenkaku")
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("は全角で入力してください")
      end

      it 'family_nameが全角でないと登録できない' do
      @user = build(:user, family_name: "kana")
      @user.valid?
      expect(@user.errors[:family_name]).to include("は全角で入力してください")
      end

      it 'first_name_kanaがカタカナでないと登録できない' do
      @user = build(:user, first_name_kana: "kana")
      @user.valid?
      expect(@user.errors[:first_name_kana]).to include("はカタカナで入力してください")
      end

      it 'family_name_kanaがカタカナでないと登録できない' do
      @user = build(:user, family_name_kana: "kana")
      @user.valid?
      expect(@user.errors[:family_name_kana]).to include("はカタカナで入力してください")
      end

      it "birthが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
      end

      it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが5文字以下であれば登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
     

      it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")    
      end
      it "emailが@を含んでいないと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be include @")
      end
      it "passwordが半角英数字混合でないと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be both letters and numbers")
      end  
    end
  end
end


