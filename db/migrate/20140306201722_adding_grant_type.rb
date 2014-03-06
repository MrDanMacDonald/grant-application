class AddingGrantType < ActiveRecord::Migration
  def change
    add_column :grant_applications, :grant_typess, :string, array: true, default: '{}'
  end
end

