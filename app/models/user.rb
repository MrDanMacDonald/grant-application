class User < ActiveRecord::Base

  has_secure_password
  belongs_to :organization 
  has_many :grant_applications

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, length: { in: 6..29}, on: :create

  before_save :generate_org

  attr_accessor :org_name

  protected

  def generate_org
    org = grab_organization
    unless org
      org = Organization.create!(name: self.org_name)
    end
    self.organization = org
  end

  def grab_organization
    Organization.where(name: self.org_name).first 
  end

end
