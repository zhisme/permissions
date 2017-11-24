FactoryGirl.define do
  factory :permission do
    action Faker::Superhero.power
    value  true
  end
end
