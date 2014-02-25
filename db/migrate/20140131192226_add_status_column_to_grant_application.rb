class AddStatusColumnToGrantApplication < ActiveRecord::Migration
  def change
  	add_column :grant_applications, :status, :string 
  end
end
