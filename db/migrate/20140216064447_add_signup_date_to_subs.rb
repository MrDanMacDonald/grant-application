class AddSignupDateToSubs < ActiveRecord::Migration
  def change
    add_column :subscriptions, :signup_date, :date 
  end
end

