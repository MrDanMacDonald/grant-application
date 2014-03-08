class AddingBusinessNumberToOrgs < ActiveRecord::Migration
  def change
    add_column :organizations, :business_number, :integer
  end
end
