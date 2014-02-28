class AddingNameColumnToOrgs < ActiveRecord::Migration
  def change
    add_column :organizations, :name, :string
  end
end
