class AddingProgramIdsToGrantApplications < ActiveRecord::Migration
  def change
    add_column :grant_applications, :program_ids, :integer
  end
end
