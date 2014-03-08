class AddingIsQualifiedDoneeToOrgs < ActiveRecord::Migration
  def change
    add_column :organizations, :is_qualified_donee, :boolean
  end
end
