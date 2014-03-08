class Organization < ActiveRecord::Base
  has_many :users
  has_many :grant_applications
  validates :name, presence: true
  validates_uniqueness_of :name
  accepts_nested_attributes_for :grant_applications
end
