class RemoveSignupDateFromSubs < ActiveRecord::Migration
  def change
    remove_column :subscriptions, :signup_date
  end
end
