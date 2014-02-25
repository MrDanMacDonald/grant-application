require 'faker'

FactoryGirl.define do

    factory :payment do
      association :subscription
      amount { 49.99}
      charge_date { Date.today + 1.month }
    end

end


