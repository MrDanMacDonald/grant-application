class AddCommentColumnToGrantApplications < ActiveRecord::Migration
  def change
  	add_column :grant_applications, :comments, :text
  end
end
