require 'pry'

class GrantApplicationsController < ApplicationController
  before_filter :current_user, :if_not_user_redirect

  def index
    @grant_applications = GrantApplication.all
  end

  def show 
    @grant_application = GrantApplication.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
   
    @grant_application = @user.grant_applications.new
  end

  def create
    @user = User.find(session[:user_id])
    @grant_application = @user.grant_applications.new(grant_application_params)
    @admins = User.where(is_admin: true)
    if @grant_application.save
      UserMailer.thankyou_email(@user).deliver
      AdminMailer.admin_notification_email(@admins, @grant_application).deliver
      redirect_to program_grant_application_path(@grant_application) 
    else
      render :new, notice: "Your application was not successfully submitted"
    end
  end

  def select_grant_program_update
    @grant_application = GrantApplication.find(params[:id])
    if @grant_application.update_attributes(grant_application_params)
      redirect_to details_grant_application_path(@grant_application)
    else
      render :select_grant_program
    end
  end

  def select_grant_program
    @grant_application = GrantApplication.find(params[:id])
  end

  def add_grant_details_update
    @grant_application = GrantApplication.find(params[:id])
    set_grant_type_to_custom
    if @grant_application.update_attributes(grant_application_params)
      redirect_to profile_path
    else
      render :add_grant_details
    end
  end

  def add_grant_details
    @grant_application = GrantApplication.find(params[:id])
  end

  def add_supplemental_info
  end

  def delete_attachment
    current_user.grant_applications.find(params[:app_id]).remove_attachment
    redirect_to user_path(current_user)
  end

  protected

  def grant_application_params
    @grant_application_params ||= params.require(:grant_application).permit(:request_amount, :intended_use, :attachment, 
      :custom_grant_type, organizations_attributes: [ :business_number ], :grant_types => [], :program_ids => [])  
  end

  def set_grant_type_to_custom
     if grant_application_params[:custom_grant_type].present?
      grant_application_params[:grant_types] = grant_application_params[:custom_grant_type].split(" ")
    else
      grant_application_params[:grant_types]
    end
  end

end

