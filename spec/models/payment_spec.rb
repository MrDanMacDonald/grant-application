require 'spec_helper'

describe Payment do
   subject{ FactoryGirl.build(:payment) }

   it "has a valid factory" do
    expect(subject).to be_valid
   end

   describe "validations" do

    it "is invalid without a subscription_id" do
      subject.subscription_id = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without an amount" do 
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a charge_date" do
      subject.charge_date = nil
      expect(subject).to_not be_valid
    end

  end
end