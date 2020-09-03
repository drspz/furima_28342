# class Order < ApplicationRecord
#   # belongs_to_active_hash :prefecture_code
#   # 空の投稿を保存できないようにする
#   with_options presence: true do
#    validates :prefecture_code_id
#   #  validates :token
#   #  validates :post_code 
#   #  validates :house_number
#   #  validates :building_name
#   #  validates :phone_number
#   #  validates :card_number
#   #  validates :card_month
#   #  validates :card_year
#   #  validates :card_security
#   #ジャンルの選択が「---」の時は保存できないようにする
#   with_options numericality: { other_than: 1 }  do
#    validates :prefecture_code_id

#   end
#   end
# end
