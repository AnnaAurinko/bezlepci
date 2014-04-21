FactoryGirl.define do

  factory :user do
    email "test@test.cz"
    first_name "John"
    last_name "Doe"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :place do
    name "Country Life"
    specification "restaurant"
    address "Manesova 25, Praha 1, 110 00"
    description "Nejlepsi bio restaurace v sirokem okoli!"
  end
end
