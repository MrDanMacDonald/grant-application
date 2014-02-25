class RemovingChargeDateFromPayments < ActiveRecord::Migration
  def change
    remove_column :payments, :charge_date
  end
end
