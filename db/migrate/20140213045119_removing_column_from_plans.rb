class RemovingColumnFromPlans < ActiveRecord::Migration
  def change
    remove_column :plans, :price
  end
end
