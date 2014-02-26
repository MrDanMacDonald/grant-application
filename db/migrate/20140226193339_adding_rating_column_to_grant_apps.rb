class AddingRatingColumnToGrantApps < ActiveRecord::Migration
  def change
    add_column :grant_applications, :rating, :integer
  end
end
