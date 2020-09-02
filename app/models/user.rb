class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :purchases
  with_options presence: true do
   validates :nick_name
   validates :birth
   validates :email,    uniqueness: {case_sensitive: false}
   validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "include both letters and numbers"}

   with_options format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, message: "Full-width characters"} do
     validates :first_name
     validates :family_name
   end

   with_options format: {with: /\A[ァ-ヶー－]+\z/, message: "Full-width katakana characters" } do
     validates :first_name_kana
     validates :family_name_kana
   end
 end


end
