class ChangeDateTimeToDate < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :next_payment_date
  end
end
