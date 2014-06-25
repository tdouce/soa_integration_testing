FactoryGirl.define do
  factory :school do
    city  { Faker::Address.city }
    state { Faker::Address.state }
    name  { Faker::Company.name }

    factory :school_with_principal do
      after(:create) do |school| 
        school.users << FactoryGirl.create(:user, principal: true)  
      end
    end
  end
end

