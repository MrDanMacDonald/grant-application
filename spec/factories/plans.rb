require 'faker'

FactoryGirl.define do

  factory :plan do 
    name { 'gold'}
    price { 49.99 }
  end

end

