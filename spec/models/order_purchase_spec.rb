require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe '配送先・取引情報情報の保存' do
    before do
      @order_purchase = FactoryBot.build(:order_purchase)
    end
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_purchase).to be_valid
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
    it 'prefecture_cordを選択していないと保存できないこと' do
      @order_purchase.prefecture = 0
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Prefecture cord can't be blank")
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
    it 'building_nameは空でも保存できること' do
      @order_purchase.building_name = nil
      expect(@order_purchase).to be_valid
    end
    
  end
end

















