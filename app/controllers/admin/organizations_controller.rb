class Admin::OrganizationsController < ApplicationController
  
  def index
    @organizations = Organization.all
  end

end
