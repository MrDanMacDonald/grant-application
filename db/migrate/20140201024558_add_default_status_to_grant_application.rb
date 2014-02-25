class AddDefaultStatusToGrantApplication < ActiveRecord::Migration
  def change
  	remove_column :grant_applications, :status
  	add_column :grant_applications, :status, :string, { default: "Review Pending" }
  end
end