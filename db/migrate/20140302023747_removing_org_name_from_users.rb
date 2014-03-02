class RemovingOrgNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :org_name
  end
end
