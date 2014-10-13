FactoryGirl.define do
  factory :animal do
    first_name { Faker::Name.first_name }
  end
end

