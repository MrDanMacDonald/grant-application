class AddingCancelDateToSubs < ActiveRecord::Migration
  def change
    add_column :subscriptions, :cancel_date, :date 
  end
end
