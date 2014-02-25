require 'spec_helper'

describe User do
  subject{ FactoryGirl.build(:user) }

  it "has a valid factory" do 
    expect(subject).to be_valid
  end

  describe "validations" do

    it "is invalid without an email" do 
      subject.email = nil
      expect(subject).to_not be_valid
    end
 
    it "is invalid with a password of insufficient length" do 
      subject.password = 'a'
      expect(subject).to_not be_valid
    end

  end
   
end