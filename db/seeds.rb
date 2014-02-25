# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Plan.destroy_all
plans = Plan.create([{ name: 'Bronze', price: 1999 }, { name: 'Silver', price: 2999 }, { name: 'Gold', price: 4999 }])

# subscriptions = Subscription.create([
#   {user: 3, plan: 3, signup_date: 2014-02-16, next_payment_date: 2014-03-16}
#   ])
Subscription.destroy_all
subscriptions = Subscription.create([{ next_payment_date: Date.today }])

