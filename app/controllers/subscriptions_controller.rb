class SubscriptionsController < ApplicationController

  require 'stripe'

  require 'pry'

  def new
    @subscription = Subscription.new
  end

  def create

    Stripe.api_key = "sk_test_tjjjQy3w92iuYyqFf2KeIWoC"
    #Stripe.api_key = ENV['MY_API_KEY']
  
    @subscription = current_user.subscriptions.new(subscription_params)

    token = params[:stripeToken]

    # Creating a new customer
    stripe_customer = Stripe::Customer.create(
      card: token,
      description: current_user.email
    )

    #Saving stripe_customer.id to Users table
    current_user.update_attributes stripe_customer_token: stripe_customer.id
    current_user.save

    #Charging the customer
    begin 
      charge = Stripe::Charge.create(
        amount: @subscription.plan.price,
        currency: "usd",
        customer: stripe_customer.id
      ) 

      if @subscription.save
        redirect_to subscriptions_path
      else
        render :new
      end

    rescue Stripe::CardError => e
      puts "Stripe Error: #{e.message}"
      #Card declined
    end
  end

  def show
    @subscriptions = current_user.subscriptions
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit(:plan_id)
  end

end
