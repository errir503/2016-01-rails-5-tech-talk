FactoryGirl.define do
  factory :user do
    name "Test User"
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "please123"
    test { object.new }
  end

  factory :admin, class: User do
    name "Admin User"
    email "test@example.com"
    password "please123"
  end
end
