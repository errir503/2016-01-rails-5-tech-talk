FactoryGirl.define do
  factory :secret do
    text "MyText"
    association :user, factory: :admin_user


    factory :funny_secret do
      text "Hahaha"
      unknown "Gurk"
    end
  end

end
