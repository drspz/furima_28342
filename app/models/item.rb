class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :preparation_day
  # 空の投稿を保存できないようにする
  with_options presence: true do
  validates :image
  validates :name
  validates :explanation
  validates :category_id
  validates :condition_id
  validates :postage_type_id
  validates :shipping_region_id
  validates :preparation_day_id
  validates :selling_price
  end
  #ジャンルの選択が「---」の時は保存できないようにする
  with_options numericality: { other_than: 1 }  do
  validates :category_id 
  validates :condition_id
  validates :postage_type_id
  validates :shipping_region_id
  validates :preparation_day_id
  end 
  # 販売価格範囲指定
  validates :selling_price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}


  #validates :text, presence: true
  belongs_to :user
  has_one :purchase
  has_one_attached :image


end

