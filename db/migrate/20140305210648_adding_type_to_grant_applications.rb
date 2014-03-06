class AddingTypeToGrantApplications < ActiveRecord::Migration
  def change
    add_column :grant_applications, :type, :string
  end
end
