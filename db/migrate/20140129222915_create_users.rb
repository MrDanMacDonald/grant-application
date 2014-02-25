class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :org_name
      t.string :role_in_org
      t.string :email
      t.string :password_digest
      t.string :phone_number
      t.string :org_website
      t.text :about

      t.timestamps
    end
  end
end
