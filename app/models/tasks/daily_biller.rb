 class Tasks::DailyBiller

  def run

    Stripe.api_key = "sk_test_tjjjQy3w92iuYyqFf2KeIWoC"
    #Stripe.api_key = ENV['MY_API_KEY']

    subscriptions = Subscription.where("subscriptions.next_payment_date <= ?", Date.today)
    puts "Running Daily Rebiller for #{subscriptions.size} subscriptions"
    
    subscriptions.each do |sub|

      begin
        Stripe::Charge.create(
          :amount => sub.plan.price,
          :currency => "usd",
          :customer => sub.user.stripe_customer_token
        )

        sub.payments.create!(amount: sub.plan.price, charge_date: Date.today)
        sub.next_payment_date = sub.next_payment_date.advance(months: 1)
        sub.save!

      rescue Stripe::CardError => e
        puts "Stripe Error: #{e.message}"

      end
    end
  end
end


 
    