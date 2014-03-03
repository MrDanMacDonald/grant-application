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
    self.first_name = params[:first_name]
    self.last_name = params[:last_name]
    self.email = params[:email]
    self.phone_number = params[:phone_number]
    self.password = params[:password]
    self.password_confirmation = params[:password_confirmation]
    self.organization_id = params[:organization_id]
    self.org_name = params[:org_name]
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
      # generate_org unless self.organization_id
      generate_org
      @user.save!
      @user
    else
      false
    end
  end 

  protected

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














