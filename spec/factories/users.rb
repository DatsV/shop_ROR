FactoryBot.define do
  factory :user do
    first_name {Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    email {Faker::Name.first_name+"@site.com"}
    role {'use'}
    password {'1234567'}

    factory :admin_user do
      after(:create) {|user| user[:role] = 'admin'}
    end
  end
end