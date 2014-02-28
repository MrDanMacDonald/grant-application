class Organization < ActiveRecord::Base
  has_many :users, :foreign_key => "organization_id"

end
