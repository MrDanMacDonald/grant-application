class Program < ActiveRecord::Base
  has_and_belongs_to_many :grant_applications
  validates_presence_of :name
end
