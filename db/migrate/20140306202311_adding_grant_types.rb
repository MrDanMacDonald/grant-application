class AddingGrantTypes < ActiveRecord::Migration
  def change
    add_column :grant_applications, :grant_types, :string, array: true, default: '{}'
  end
end
