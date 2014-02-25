class CreateGrantApplications < ActiveRecord::Migration
  def change
    create_table :grant_applications do |t|
      t.integer :request_amount
      t.text :intended_use
      t.references :user, index: true

      t.timestamps
    end
  end
end
