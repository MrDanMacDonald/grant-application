class RemoveTokenFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :stripe_customer_token
  end
end
