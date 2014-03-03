require 'pry'
class OrgRegForm
  include ActiveModel::Model 

  attr_accessor :org_name, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation,
                :organization_id
  attr_accessor :organization

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, length: { in: 6..29}, on: :create

  def initialize(user)
    @user = user
  end

  def submit(params)
    #assign params to self.attributes
    self.first_name = params[:first_name]
    self.last_name = params[:last_name]
    self.email = params[:email]
    self.phone_number = params[:phone_number]
    self.password = params[:password]
    self.password_confirmation = params[:password_confirmation]
    self.organization_id = params[:organization_id]
    if valid? #check form object validations
      #assign attributes to user model object
      generate_org
      @user = User.new(first_name: self.first_name,
                       last_name: self.last_name,
                       email: self.email,
                       phone_number: self.phone_number,
                       password: self.password,
                       password_confirmation: self.password_confirmation,
                       organization_id: self.organization_id)
                      #checks usermodel validations
      @user.save!
      @user
      true 
    else
      false
    end
  end 

  protected

  #Needs to be fixed.  Name is currently showing nil when you choose an existing org
  #Also try using @user instead of self
  def generate_org
    org = grab_organization
    self.organization.save!(name: self.org_name) unless org 
    self.organization = org
  end

  def grab_organization
    Organization.where(name: self.org_name).first 
  end

end