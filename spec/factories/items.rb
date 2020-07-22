FactoryBot.define do
  factory :item do
    name                          { '教科書' }
    introduction                  { '脱・初心者' }
    category_id                   { '2' }
    item_condition_id             { '2' }
    postage_payer_id              { '2' }
    prefecture_code_id            { '2' }
    preparation_day_id            { '2' }
    user_id                       { '2' }
    price                         { '3000' }

    association :user
    after(:build) { |item| item.image.attach(io: File.open('spec/fixtures/test_1.jpg'), filename: 'test_1.jpg', content_type: 'image/jpg') }
  end
end
