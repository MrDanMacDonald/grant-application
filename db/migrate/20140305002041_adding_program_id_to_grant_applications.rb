class AddingProgramIdToGrantApplications < ActiveRecord::Migration
  def change
    add_column :grant_applications, :program_id, :integer
  end
end
