require 'spec_helper'

describe Tasks::DailyBiller do
  subject(:dailybiller) { Tasks::DailyBiller.new }

  context "one subscription due to be charged today" do

    before do
      @subscription = FactoryGirl.create :subscription, :due_today
      @upcoming_subscription = FactoryGirl.create :subscription, :upcoming
    end
 

    it "attempts to charge the subscription" do
      allow(Stripe::Charge).to receive(:create)

      dailybiller.run
  
      expect(@subscription.reload.next_payment_date).to eq(Date.today.advance(months: 1)) # moved to next month
      expect(@upcoming_subscription.reload.next_payment_date).to eq(15.days.from_now.to_date) # no change
    end

    it "creates a new payment" do
      allow(Stripe::Charge).to receive(:create)
      dailybiller.run
      expect(subscription.reload.payments.first).to be_a(Payment)
      expect(upcoming_subscription.reload.payments.first).to eq(nil)
    end

    it "sets the next_payment_date" do
      allow(Stripe::Charge).to receive(:create)
      dailybiller.run
      expect(subscription.next_payment_date).to eq(Date.today + 1.month)
    end
  end


  context "declining card" do
  end

end
