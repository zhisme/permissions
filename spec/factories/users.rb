FactoryGirl.define do
  factory :user do
    username Faker::Superhero.name
    email    Faker::Internet.email
  end
end
