FactoryBot.define do
  factory :book do
    name { Faker::Book.title }
    author { Faker::Book.author }
    description { Faker::Lorem.paragraph }
    image { Faker::Lorem.sentence }
    status { 'In' }
  end
end
