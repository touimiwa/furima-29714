FactoryBot.define do
  factory :order_address do
    token        {'test'}
    postal_cord  {'123-4567' }
    area_id      { 1 }
    municipality { '大阪市' }
    place        { '1-1' }
    phone_number { '09038417800' }
    association :user
    association :item
  end
end
