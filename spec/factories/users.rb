FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"toy1007"}
    password_confirmation {password}
    last_name             {"阿部"}
    first_name            {"太郎"}
    kanalast_name         {"アベ"}
    kanafirst_name        {"タロウ"}
    birthday              {"2000-11-11"}
  end
end