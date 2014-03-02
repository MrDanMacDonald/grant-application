class OrgRegForm
  include ActiveModel::Model 
  attr_accessor :id, :org_name, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation,
                :organization_id

  def initialize(user)
    @user = user
  end

  def generate_org
    org = grab_organization
    unless org
      org = Organization.create!(name: org_name)
    end
    @user.organization = org
  end

  def grab_organization
    Organization.where(name: name).first 
  end

end