require 'spec_helper'

describe SubscriptionsController do
  
  describe 'GET#new' do
    it "assigns a new Subscription to @subscription" do
      get :new
      expect(assigns(:subscription)).to be_a_new(Subscription)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'POST#create' do

    context "with valid attributes" do

      let(:plan) { FactoryGirl.create(:plan) }
      let(:user) { FactoryGirl.create(:user) }
      let(:stripe_customer) { double("stripe_customer", id: "stripecustomerid") }

      it "saves the new subscription to the database" do
        expect(Stripe::Customer).to receive(:create).and_return(stripe_customer)
        expect(Stripe::Charge).to receive(:create)
        expect {
          post :create, { subscription: { plan_id: plan.id }, token: "randomstring"}, { user_id: user.id }
        }.to change(Subscription, :count).by(1)
      end

      it "calls Stripe::Charge with the correct amount and other info" do
        expect(Stripe::Charge).to receive(:create).with({
          amount: plan.price,
          currency: "usd",
          customer: "stripecustomerid"
          })
        expect(Stripe::Customer).to receive(:create).and_return(stripe_customer)
        post :create, { subscription: { plan_id: plan.id }, token: "somerandomstring" }, { user_id: user.id }
      end

      it "redirects to subscription#show" do
        expect(Stripe::Charge).to receive(:create)
        expect(Stripe::Customer).to receive(:create).and_return(stripe_customer)
        post :create, { subscription: { plan_id: plan.id }, token: "somerandomstring" }, { user_id: user.id }
        expect(response).to redirect_to subscriptions_path
      end

    end

    context "with invalid attributes" do

      it "does not save the contact to the database" do
      end

      it "re-renders the :new template" do
      end

    end

  end

  describe 'GET#edit' do
  end

  describe 'PUT#update' do
  end

  describe 'DELETE#destroy' do
  end


end
