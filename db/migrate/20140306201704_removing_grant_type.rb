class RemovingGrantType < ActiveRecord::Migration
  def change
    remove_column :grant_applications, :grant_type
  end
end
