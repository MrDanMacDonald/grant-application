class Admin::GrantApplicationsController < Admin::AdminController
  before_filter :is_admin?, :non_admin_redirect

  def index
    @grant_applications = GrantApplication.all
    #render text: "You are admin."
  end

  def show
  	@grant_application = GrantApplication.find(params[:id])	
  end

  def edit
  	@grant_application = GrantApplication.find(params[:id])	
  end

  def update 
  	@grant_application = GrantApplication.find(params[:id])

  	if @grant_application.update_attributes(grant_application_params)
  		redirect_to admin_grant_applications_path
  	else 
  		render :edit
  	end
  end

  def destroy
    @grant_application = GrantApplication.find(params[:id])
    @grant_application.destroy
    redirect_to admin_grant_applications_path #update this when admin/ is up.
  end

  protected

  def grant_application_params
  	params.require(:grant_application).permit(:comments, :status, :attachment)
  end

end