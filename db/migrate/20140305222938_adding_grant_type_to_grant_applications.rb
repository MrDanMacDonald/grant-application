class AddingGrantTypeToGrantApplications < ActiveRecord::Migration
  def change
    add_column :grant_applications, :grant_type, :string 
  end
end
