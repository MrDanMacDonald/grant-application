require 'spec_helper'

describe Subscription do
  subject{ FactoryGirl.create(:subscription) }
  
  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "validations" do 
    it "is invalid without a user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a plan_id" do
      subject.plan_id = nil
      expect(subject).to_not be_valid
    end

    it "sets a signup_date if signup_date is nil" do
      subject.signup_date = nil
      expect(subject).to be_valid
    end
  end

  it "generates a next_payment_date based on the signup_date" do
    expect(subject).to be_valid
    expect(subject.next_payment_date).to eq(subject.signup_date + 1.month)
  end

end

