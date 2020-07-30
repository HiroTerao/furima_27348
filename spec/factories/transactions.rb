FactoryBot.define do
  factory :transaction do
    post_code           { '111-1111' }
    prefecture_code_id  { '2' }
    city                { '札幌市' }
    house_number        { '札幌町11-11' }
    building_name       { 'ドーミー金沢714' }
    phone_number        { '09011112222' }
    item_id             { '2' }
  end
end
