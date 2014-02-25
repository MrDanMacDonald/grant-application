class ConditionalStatementForAdmin < ActiveRecord::Migration
  def change
    User.all.each do |user|
      user.is_admin = false
      user.save
    end
    puts 'Done'
  end
end
