class GrantApplicationsPrograms < ActiveRecord::Migration
  def change
    create_table :grant_applications_programs, id: false do |t|
      t.integer :grant_application_id
      t.integer :program_id
    end
  end
end
