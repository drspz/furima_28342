class Item < ApplicationRecord
  #validates :text, presence: true
  belongs_to :user
end
