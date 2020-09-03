class OrderPurchase

  include ActiveModel::Model
  attr_accessor :token,  :post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :purchase_id, :item_id, :user_id

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :prefecture_code_id
    # validates :selling_price
    validates :post_code 
    validates :house_number
    validates :token
    # validates :building_name
    validates :phone_number
    # validates :card_number
    # validates :card_month
    # validates :card_year
    # validates :card_security
  end

  #ジャンルの選択が「---」の時は保存できないようにする
  #都道府県に関するバリデーション
  with_options numericality: { other_than: 1 }  do
    validates :prefecture_code_id
  end

   # 郵便番号にハイフンが必要である
   validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
   # 電話番号にハイフン不要で11桁以内であること
   validates :phone_number, format: {with: /\A\d{11}\z/, message: "is invalid"}
  def save
    # 住所の情報を保存
    Order.create( post_code: post_code, prefecture_code_id: prefecture_code_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase_id)
    # 購入の情報を保存
    Purchase.create(item_id: item_id, user_id: user_id)
  end

  end



