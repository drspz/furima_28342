class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
 with_options presence: true do
    validates :nick_name
    validates :first_name
    validates :family_name
    validates :first_name_kana
    validates :family_name_kana
    validates :email
    validates :password
    validates :password_confirmation
    validates :birth
 end

end
