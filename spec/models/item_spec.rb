require 'rails_helper'

# RSpec.describe Item, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Item do
  before do
    @user = FactoryBot.build(:item)
  end

  describe '出品商品登録' do
   context '出品商品登録がうまくいくとき' do
       it "nameとexplanation、category_idとcondition_id,postage_type_id,shipping_region_id,preparation_day_id,selling_priceなどが存在すれば登録できること" do
       expect(item).to be_valid
       end
   end

   context '出品商品登録がうまくいかないとき' do
      it "nameが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "explanationが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it "category_idが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end

      it "condition_idが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition_id can't be blank")
      end

      it "postage_type_idが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage_type_id can't be blank")
      end

      it "shipping_region_idが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping_region_id can't be blank")
      end

      it "preparation_day_idが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Preparation_day_id can't be blank")
      end

      it "selling_priceが空では登録できない" do
      @item.email = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling_price can't be blank")
      end
    end
  end