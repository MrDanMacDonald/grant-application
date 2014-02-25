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
    #@grant_application = GrantApplication.new
  end

  def create
    @user = User.find(session[:user_id])
    @grant_application = @user.grant_applications.new(grant_application_params)

    if @grant_application.save
      redirect_to user_path(@user.id)
    else 
      render :new #,notice: "Your application did not go through."
    end
  end

  def delete_attachment
    current_user.grant_applications.find(params[:app_id]).remove_attachment
    redirect_to user_path(current_user)
  end

  protected



  def grant_application_params
    params.require(:grant_application).permit(:request_amount, :intended_use, :attachment)
  end

end

