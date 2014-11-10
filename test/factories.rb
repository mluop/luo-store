FactoryGirl.define do 
  factory :user do
    email {generate(:email)}
    trait :admin do
      is_admin true
    end
  end
  sequence :email do |n|
    "holyemail#{n}@example.com"
  end
  factory :product do
    name "great"
    price 0.23
  end
end