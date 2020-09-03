FactoryBot.define do
  factory :order_purchase do
    post_code { '123-4567' }
    prefecture_code_id { 2 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone_number { '09012341234' }
    price { 2000 }
    token {'abcdefd'}
  end
end
