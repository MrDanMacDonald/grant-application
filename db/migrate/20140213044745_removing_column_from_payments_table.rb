class RemovingColumnFromPaymentsTable < ActiveRecord::Migration
  def change
    remove_column :payments, :amount
  end
end
