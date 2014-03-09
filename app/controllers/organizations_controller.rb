class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
    @organization.users.build 
  end

  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      redirect_to organizations_path
    else
      render :new
    end
  end

  def show
    @organization = Organization.find(params[:id])
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      redirect_to organizations_path
    else
      render :edit
    end
  end

  def verify_eligibility
    @organization = Organization.find(params[:id])
  end

  def verify_eligibility_update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      redirect_to profile_path
    else 
      render :verify_eligibility
    end
  end

  def destroy
    @organization = Organization.find(params[:id])
    @grant_application.destroy
    redirect_to organizations_path
  end

  protected

  def organization_params
    params.require(:organization).permit(:name, :business_number, :is_qualified_donee)
  end

end
