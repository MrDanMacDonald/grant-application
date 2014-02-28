class User < ActiveRecord::Base
  has_secure_password
  belongs_to :organization
  has_many :grant_applications
  before_save :create_org

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, length: { in: 6..29}, on: :create

  def create_org
    if check_if_org_is_new
      Organization.create!(name: self.org_name)
    end
  end

  def check_if_org_is_new
    @organizations = Organization.all
      @organizations.each do |o|
        if o.name == self.org_name
          flash[:notice] = "This Organization Already Exists"
          return false
        else
          return true
        end
      end
  end
end
