class Subscription < ActiveRecord::Base

  require 'pry'
  belongs_to :user
  belongs_to :plan 
  has_many :payments

  # before_save :set_next_payment_date
  after_save :gen_payment
  #Can't create payment before save because the payment needs a subscription id
  #which it won't have unless the subscription is saved.

  before_validation :set_signup_date
  validates :user, :plan, :signup_date, presence: true

  protected

#Responsibility of rebiller
  # def set_next_payment_date
  #   if self.next_payment_date.blank?
  #     self.next_payment_date = self.signup_date + 1.month
  #   else
  #     self.next_payment_date += 1.month
  #   end
  # end

  def gen_payment
    self.payments.create!(amount: self.plan.price, charge_date: Date.today)
  end

  def set_signup_date
    self.signup_date ||= Date.today
  end

end
