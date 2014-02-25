class RemoveColumnFromSubs < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :charge_date
  end
end
