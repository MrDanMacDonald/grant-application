class Plan < ActiveRecord::Base

  validates :name, :price, presence: true

  has_many :subcriptions

end
