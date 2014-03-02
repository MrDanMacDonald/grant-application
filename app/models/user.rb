class User < ActiveRecord::Base
  has_secure_password
  belongs_to :organization # organization
  has_many :grant_applications
  before_save :generate_org

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, length: { in: 6..29}, on: :create

  protected

  def generate_org
    org = grab_organization
    unless org
      org = Organization.create!(name: self.org_name)
    end
    self.organization = org
  end

  # def create_organization(name)
  #   self.organization.create(name: name)
  # end

  def grab_organization
    Organization.where(name: self.org_name).first 
  end
end
