class Payment < ActiveRecord::Base
  belongs_to :subscription

  validates :subscription_id, :amount, :charge_date, presence: true

end
