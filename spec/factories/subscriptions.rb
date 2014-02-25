require 'faker'

FactoryGirl.define do

  factory :subscription do 
    association :user
    association :plan
    signup_date { Date.today }
  end

  trait :due_today do
    next_payment_date { Date.today }
  end

  trait :upcoming do
    next_payment_date { Date.today + 15.days }
  end

end


