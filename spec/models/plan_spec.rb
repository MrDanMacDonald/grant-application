require 'spec_helper'

describe Plan do
  subject{ FactoryGirl.build(:plan) }

  it "has a valid factory" do
    expect(subject).to be_valid
  end

  describe "validations" do

    it "is valid with a name and a price" do
      expect(subject).to be_valid
    end

    it "is invalid without a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is invalid without a price" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

  end

end