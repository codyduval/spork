FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    admin false
  end

  factory :child, class: User do
    first_name "Child"
    last_name  "User"
    admin      false

    association :parent, factory: :user
  end
end
