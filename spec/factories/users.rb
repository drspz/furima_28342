FactoryBot.define do
  factory :user do
    nick_name                  {"taro"}
    first_name                 {"abe"}
    family_name                {"kentaro"}
    first_name_kana            {"abe"}
    family_name_kana           {"kentaro"}
    email                      {"aaa@gmail.com"}
    password                   {"000000"}
    password_confirmation      {password}
    birth                      {"0000"}
  end
end