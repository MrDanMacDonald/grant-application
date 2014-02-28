require 'pry'
class UsersController < ApplicationController
  
  before_filter :current_user

  before_filter :if_not_user_redirect, only: [:show, :edit, :update] 

  def show
    redirect_to admin_grant_applications_path if current_user.is_admin?
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def profile
    @user = User.find(session[:user_id])
    render :show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else 
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  protected

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :middle_initial, :role_in_org, :org_name, :org_website, :phone_number,
      :email, :password, :password_confirmation, :about, :username, :organization_id) 
  end
end
