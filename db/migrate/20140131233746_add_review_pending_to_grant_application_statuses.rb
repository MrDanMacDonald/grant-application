class AddReviewPendingToGrantApplicationStatuses < ActiveRecord::Migration
  def change
  	GrantApplication.all.each do |x|
  		x.status = "Review Pending"
  		x.save
  		puts "Done!"
  	end
  end
end
