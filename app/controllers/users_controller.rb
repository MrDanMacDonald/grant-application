require 'pry'

class UsersController < ApplicationController
  
  before_filter :current_user
  before_filter :if_not_user_redirect, only: [:show, :edit, :update] 

  def new
    @org_reg_form = OrgRegForm.new(User.new)
  end

  def profile
    @user = User.find(session[:user_id])
    render :show
  end

  def create
    @org_reg_form = OrgRegForm.new(User.new)
    if @user = @org_reg_form.submit(params[:org_reg_form])
      session[:user_id] = @user.id
      redirect_to profile_path, notice: "Successfully registered."
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

  def show
    redirect_to admin_grant_applications_path if current_user.is_admin?
    @user = User.find(session[:user_id])
  end

end
