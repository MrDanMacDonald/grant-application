class UsersController < ApplicationController
  
  before_filter :current_user
  before_filter :if_not_user_redirect, only: [:show, :edit, :update] 

  def new
    @user = User.new
    @organization = Organization.new
    @organizations = Organization.all
  end

  def profile
    @user = User.find(session[:user_id])
    render :show
  end

  def create
  @user = User.new(user_params)
    if @user.save(user_params)
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

  protected

  def user_params
    params.require(:user).permit(:org_name, :first_name, :last_name, :email, :phone_number, :password, :password_confirmation,
                          :organization_id, {:organizations => [ :name, :organization_id ]})
  end

end
