class User < ActiveRecord::Base
  has_secure_password
  belongs_to :organization
  has_many :grant_applications

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :password, length: { in: 6..29}, on: :create

end
