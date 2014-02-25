class RemovingCancelDateFromSubs < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :cancel_date
  end
end
