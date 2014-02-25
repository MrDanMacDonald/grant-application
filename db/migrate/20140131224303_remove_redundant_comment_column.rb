class RemoveRedundantCommentColumn < ActiveRecord::Migration
  def change
  	remove_column :grant_applications, :comment
  end
end
