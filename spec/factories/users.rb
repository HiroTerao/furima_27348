FactoryBot.define do
  factory :user do
    nickname                        { 'takkun' }
    email                           { 'kkk@gmail.com' }
    password                        { 'test12345test' }
    password_confirmation           { 'test12345test' }
    last_name                       { '田中' }
    first_name                      { '太郎' }
    last_name_kana                  { 'タナカ' }
    first_name_kana                 { 'タロウ' }
    birth                           { '2020-01-01' }
  end
end
