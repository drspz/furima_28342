class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :preparation_day
  # 空の投稿を保存できないようにする
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_type_id, presence: true
  validates :shipping_region_id, presence: true
  validates :preparation_day_id, presence: true
  validates :selling_price, presence: true
  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :postage_type_id, numericality: { other_than: 1 } 
  validates :shipping_region_id, numericality: { other_than: 1 } 
  validates :preparation_day_id, numericality: { other_than: 1 } 

  #validates :text, presence: true
  belongs_to :user
  has_one_attached :image
  # validates :image, presence: true, unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end

end
