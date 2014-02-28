class Organization < ActiveRecord::Base
  has_many :users, :foreign_key => "organization_id"
  # validates_presence_of :name

end
