FactoryBot.define do
  factory :item do
    name            { 'tomato' }
    description     { 'aaa' }
    category_id     { 1 }
    condition_id    { 1 }
    charge_id       { 1 }
    area_id         { 1 }
    days_id         { 1 }
    price           { 3000 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
