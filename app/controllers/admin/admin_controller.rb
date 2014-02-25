class Admin::AdminController < ApplicationController
  # before: 

protected

  def non_admin_redirect
    unless is_admin?
      redirect_to root_path, notice: "#{is_admin?}"
    end
  end

end