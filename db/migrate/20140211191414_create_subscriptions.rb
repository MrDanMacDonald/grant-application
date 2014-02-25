class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :plan_id
      t.datetime :signup_date
      t.datetime :cancel_date
      t.datetime :next_payment_date

      t.timestamps
    end
  end
end
