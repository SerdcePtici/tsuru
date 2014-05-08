
FactoryGirl.define do
  factory :admin, class: User do
    sequence :email do |n|
      "admin#{n}@example.com"
    end
    password '12345678'
  end
end