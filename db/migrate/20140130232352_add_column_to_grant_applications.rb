class AddColumnToGrantApplications < ActiveRecord::Migration
  def change
  	add_column :grant_applications, :attachment, :string
  end
end
