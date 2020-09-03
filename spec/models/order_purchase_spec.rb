require 'rails_helper'

describe  OrderPurchase do
    before do
      @order_purchase = FactoryBot.build(:order_purchase)
    end

  describe '配送先・取引情報情報の保存' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_purchase).to be_valid
    end
  end

  context '配送先・取引情報情報の保存がうまくいかないとき' do
    it 'tokenが空だと保存できないこと' do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeが空だと保存できないこと' do
      @order_purchase.post_code = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Post code can't be blank")
    end
    it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_purchase.post_code = '1234567'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'prefecture_codeを選択していないと保存できないこと' do
      @order_purchase.prefecture_code_id = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Prefecture code can't be blank")
    end
    it 'cityは空だと保存できない' do
      @order_purchase.city = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("City can't be blank")
    end
    it 'house_numberは空だと保存できない' do
      @order_purchase.house_number = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("House number can't be blank")
    end
    it "phone_numberが12桁以上であれば保存できない" do    
      @order_purchase.phone_number = "12345678912345"
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberは空だと保存できない' do
      @order_purchase.phone_number = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
    end
  end
end

















