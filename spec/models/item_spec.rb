require 'rails_helper'

describe Item do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
       it "nameとexplanation、category_idとcondition_id,postage_type_id,shipping_region_id,preparation_day_id,selling_priceなどが存在すれば登録できること" do
       expect(item).to be_valid
       end
   end

   context '出品商品登録がうまくいかないとき' do
      it "nameが空では登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explanationが空では登録できない" do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが空では登録できない" do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "condition_idが空では登録できない" do
      @item.condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "postage_type_idが空では登録できない" do
      @item.postage_type_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage_type can't be blank")
      end

      it "shipping_region_idが空では登録できない" do
      @item.shipping_region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_region can't be blank")
      end

      it "preparation_day_idが空では登録できない" do
      @item.preparation_day_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation_day can't be blank")
      end

      it "selling_priceが空では登録できない" do
      @item.selling_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price can't be blank")
      end

      it "selling_priceが300円未満でないと登録できない" do
      @item.selling_price = "299"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price is out of setting range")
      end

      it "selling_priceが10000000円を超過すると登録できない" do
      @item.selling_price = 10000001
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price is out of setting range")
      end
    end
  end
end