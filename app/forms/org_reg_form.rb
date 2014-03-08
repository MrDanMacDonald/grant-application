require 'pry'
class OrgRegForm
  include ActiveModel::Model 

  attr_accessor :org_name, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation,
                :organization_id
  attr_accessor :organization

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, length: { in: 6..29}, on: :create
  # validate :presence_of_org_name

  def initialize(user)
    @user = user
  end

  def submit(params)
    new_params = scrub_params(params)
    self.first_name = new_params[:first_name]
    self.last_name = new_params[:last_name]
    self.email = new_params[:email]
    self.phone_number = new_params[:phone_number]
    self.password = new_params[:password]
    self.password_confirmation = new_params[:password_confirmation]
    self.organization_id = new_params[:organization_id]
    self.org_name = new_params[:org_name]
    # check form object validations
    if valid? 
      #assign attributes to user model object
      @user = User.new(first_name: self.first_name,
                       last_name: self.last_name,
                       email: self.email,
                       phone_number: self.phone_number,
                       password: self.password,
                       password_confirmation: self.password_confirmation,
                       organization_id: organization_id)
                      #checks usermodel validations
      generate_org
      @user.save!
      @user
    else
      false
    end
  end 

  protected

  #refactor
  def scrub_params(params)
    if params[:org_name].present?
      params.delete(:organization_id)
      params
    else
      params
    end
  end
  
  def generate_org
    org = grab_organization
    #if org is nil, create a new organization with name of org_name
    org = Organization.create!(name: self.org_name) unless org 
    @user.organization = org
  end

  def grab_organization
    #this should return nil when you create a new org that is not in the DB
    Organization.where(name: self.org_name).first 
  end

end














