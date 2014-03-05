class RemovingProgramIdFromGrantApplications < ActiveRecord::Migration
  def change
    remove_column :grant_applications, :program_id
  end
end
