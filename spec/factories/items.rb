FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    description {Faker::Lorem.characters(number: 10)}
    price {Faker::Number.within(range: 0.5..1.5)}
  end
end