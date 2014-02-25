class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])||User.find_by(username: params[:email])
    
    if @user && @user.authenticate(params[:password])
      if @user.is_admin?
        session[:user_id] = @user.id
        redirect_to admin_grant_applications_path
        return true
      end
      session[:user_id] = @user.id
      redirect_to profile_path, notice: "Hello, #{@user.first_name}!"
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Bye for now!"
  end

end
