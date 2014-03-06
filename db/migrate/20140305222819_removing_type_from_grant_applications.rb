class RemovingTypeFromGrantApplications < ActiveRecord::Migration
  def change
    remove_column :grant_applications, :type
  end
end
