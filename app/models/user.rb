class User < ActiveRecord::Base
  has_secure_password
  has_many :grant_applications

  validates :email, presence: true
  validates :password, length: { in: 6..29}, on: :create

  has_many :subscriptions
  

## Commented out additional validations now for the purpose of speed
=begin
  validates :first_name, :last_name, :org_name, :role_in_org, :org_website, :phone_number, :email, :username, presence: true
  validates :password, length: { in: 6..29}, on: :create
=end
end
